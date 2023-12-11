part of 'models.dart';

class Compound {
  final PeriodicTableElement element;
  final String name;
  final String formula;
  final String type;
  Compound({
    required this.element,
    required this.name,
    required this.formula,
    required this.type,
  });
  /* return PeriodicTableElement(
    atomicNumber: '',
    symbol: "${element.symbol}2O",
    name: "Oxido de ${element.name.toLowerCase()} ",
    group: element.group,
    valencias: element.valencias,
    typeElement: element.typeElement,
  ) ;*/
}

List<Compound> generateOxidosByOneElement(PeriodicTableElement element) {
  final compound = <Compound>[];

  if (element.valencias.isEmpty) {
    return compound;
  }

  for (var valencia in element.valencias) {
    final elementIsOne = valencia.value == 1 ? "" : valencia.value;
    final suffix = element.valencias.length == 1 ? "" : valencia.suffix.name;

    compound.add(Compound(
      element: element,
      name: "Oxido ${element.name.toLowerCase()} $suffix",
      formula: hasNumber(element.symbol)
          ? "\\(${element.symbol}\\)${2}O$elementIsOne"
          : "${element.symbol}${2}O$elementIsOne",
      type: "Oxido",
    ));
  }

  return compound;
}

List<Compound> generateOxidosByGroupElements(Group group) {
  final elements = filterByGroup(group);
  final compound = <Compound>[];
  elements.forEach((element) {
    compound.addAll(generateOxidosByOneElement(element));
  });
  return compound;
}
