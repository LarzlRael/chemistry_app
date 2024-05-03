// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'models.dart';

enum Group {
  todo,
  monovalente,
  bivalente,
  trivalente,
  monotrivalente,
  bitetravalente,
  bitrivalente,
  monoBivalente,
  anfotero,
  halogeno,
  anfigenos,
  nitrogeniodes,
  carbonoides,
}

enum TypeValencia {
  ico,
  oso,
  hipo_oso,
  per_ico,
}

enum TypeElement {
  metal,
  no_metal,
  metaloide,
}

class Valencia {
  final int value;
  final TypeValencia suffix;
  final TypeElement? typeElement;
  Valencia({
    required this.value,
    required this.suffix,
    this.typeElement = TypeElement.metal,
  });
}

class PeriodicTableElement {
  final String name;
  final String symbol;
  final String atomicNumber;
  final Group group;

  final List<Valencia> valencias;
  PeriodicTableElement({
    required this.name,
    required this.symbol,
    required this.atomicNumber,
    required this.group,
    required this.valencias,
  });

  PeriodicTableElement copyWith({
    String? name,
    String? symbol,
    String? atomicNumber,
    Group? group,
    TypeElement? typeElement,
    List<Valencia>? valencias,
  }) {
    return PeriodicTableElement(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      atomicNumber: atomicNumber ?? this.atomicNumber,
      group: group ?? this.group,
      valencias: valencias ?? this.valencias,
    );
  }
}

final metalGroup = <Group>[
  Group.monovalente,
  Group.bivalente,
  Group.trivalente,
  Group.monoBivalente,
  Group.monotrivalente,
  Group.bitetravalente,
  Group.bitrivalente,
  Group.anfotero,
];

final peroxideGroup = <Group>[
  Group.monovalente,
  Group.bivalente,
];
final oxidosDoble = <Group>[
  Group.bitetravalente,
  Group.bitrivalente,
  Group.anfotero
];
final noMetalGroup = <Group>[
  Group.halogeno,
  Group.anfigenos,
  Group.nitrogeniodes,
  Group.carbonoides,
  Group.anfotero,
];

final oxidoGroup = metalGroup;
final peroxidoGroup = peroxideGroup;
final oxidoDobleGroup = oxidosDoble;
final hidroxidoGroup = metalGroup;
final hidruroGroup = metalGroup;
final anhidridoGroup = noMetalGroup;
final acidoOxacidoGroup = noMetalGroup;
final acidoPolihidratadoGroup = noMetalGroup;
final ionGroup = noMetalGroup;
final salesHidracidas = [
  Group.halogeno,
  Group.anfigenos,
];

List<TypeCompound> generatePossibleCombinations(Group group) {
  var combinations = <TypeCompound>[];

  if (oxidoGroup.contains(group)) combinations.add(TypeCompound.oxido);
  if (peroxidoGroup.contains(group)) combinations.add(TypeCompound.peroxido);
  if (oxidoDobleGroup.contains(group))
    combinations.add(TypeCompound.oxido_doble);
  if (hidroxidoGroup.contains(group)) combinations.add(TypeCompound.hidroxido);
  if (hidruroGroup.contains(group)) combinations.add(TypeCompound.hidruro);
  if (anhidridoGroup.contains(group)) combinations.add(TypeCompound.anhidrido);
  if (acidoOxacidoGroup.contains(group))
    combinations.add(TypeCompound.acido_oxacido);
  if (acidoPolihidratadoGroup.contains(group))
    combinations.add(TypeCompound.acido_polihidratado);
  if (ionGroup.contains(group)) combinations.add(TypeCompound.ion);

  return combinations;
}

List<Compound> genereateOptions(
    List<TypeCompound> groups, PeriodicTableElement element) {
  var options = <Compound>[];
  for (var group in groups) {
    switch (group) {
      case TypeCompound.oxido:
        options.addAll(generateOxidosByOneElement(element));
        break;

      case TypeCompound.peroxido:
        options.addAll(generatePeroxidoByOneElement(element));
        break;
      case TypeCompound.oxido_doble:
        options.addAll(generateOxidosDoblesByOneElement(element));
        break;
      case TypeCompound.hidroxido:
        options.addAll(generateHidroxidosByOneElement(element));
        break;
      case TypeCompound.hidruro:
        options.addAll(generateHidrurosByOneElement(element));
        break;
      case TypeCompound.anhidrido:
        options.addAll(generateAnhidridosByOneElement(element));
        break;
      case TypeCompound.acido_oxacido:
        options.addAll(generateAcidosOxacidosByOneElement(element));
        break;
      /* case TypeCompound.acido_polihidratado:
        options.addAll(generateAcidosPolihidratadosByOneElement());
        break; */
      case TypeCompound.ion:
        options.addAll(generateIonesByOneElement(element));
        break;
      default:
        [];
    }
  }
  if (exceptions.contains(element.symbol)) {
    options.addAll(generateAcidosPolihidratadosByOneElement());
  }
  return options;
}

CompoundGuessGame generateCompoundGuessGame() {
  final element = getTOneRandomElement(allListPeriodic);
  /* final element = getOneELement(allListPeriodic, "Sb"); */

  final options = genereateOptions(
    generatePossibleCombinations(element.group),
    element,
  );
  final only4Options = options.length >= 4 ? options.take(4).toList() : options;

  final correctElement = only4Options[Random().nextInt(only4Options.length)];
  final sufleElements = List<Compound>.from(only4Options)..shuffle();
  return CompoundGuessGame(
    elements: sufleElements,
    correctElement: correctElement,
  );
}

CompoundGuessGame generateCompoundTypeGame(List<Compound> compounds) {
  return CompoundGuessGame(
    elements: List<Compound>.from(compounds)..shuffle(),
    correctElement: compounds[Random().nextInt(compounds.length)],
  );
}

class CompoundGuessGame {
  List<Compound> elements;
  Compound correctElement;
  CompoundGuessGame({
    required this.elements,
    required this.correctElement,
  });
}

final Map<Group, int> noMetalesNegativeValue = {
  Group.halogeno: -1,
  Group.anfigenos: -2,
  Group.nitrogeniodes: -3,
  Group.carbonoides: -4,
};
