part of 'models.dart';

enum TypeCompound {
  oxido,
  peroxido,
  hidroxido,
  oxido_doble,
  acido,
  sal,
  hidracido,
  oxoacido,
}

class Valence {
  final int value;
  final String suffix;
  Valence({
    required this.value,
    required this.suffix,
  });
}

class Compound {
  final PeriodicTableElement element;
  final String name;
  final List<Valence> formula;
  final TypeCompound type;
  Compound({
    required this.element,
    required this.name,
    required this.formula,
    required this.type,
  });
}

List<Compound> generateOxidosByOneElement(PeriodicTableElement element) {
  final compounds = <Compound>[];

  if (element.valencias.isEmpty) {
    return compounds;
  }
  final specialNameCases = {
    'Au': 'aur',
    'Pb': 'plumb',
    'Cu': 'cupr',
    'Fe': 'ferr',
    'Mn': 'mangan',
  };

  for (var valencia in element.valencias) {
    final oxideValue = Valence(
      value: 2,
      suffix: "O",
    );
    const OXIDE_VALUE = 2;
    final elementIsOne = valencia.value == 1 ? "" : valencia.value;
    int elementValue = valencia.value;

    /* get oso or ico */
    final suffix = element.valencias.length == 1 ? "" : valencia.suffix.name;
    final firstValence = Valence(
      suffix: element.symbol,
      value: 2,
    );
    final secondValence = Valence(
      suffix: oxideValue.suffix,
      value: elementValue ~/ OXIDE_VALUE,
    );
    String name = "";

    /* if (elementValue % OXIDE_VALUE == 0) {
      if (elementValue % 2 == 0) {
        oxideValue = elementValue ~/ OXIDE_VALUE;
        elementValue = elementValue ~/ OXIDE_VALUE;
      } else {
        oxideValue = elementValue;
      }
    } */
    if (element.valencias.length == 1) {
      name = "Oxido de ${element.name.toLowerCase()}";
    } else {
      name = "Oxido ${element.name.toLowerCase().substring(
            0,
            element.name.length - 1,
          )}$suffix";
      name = fixIcoWord(name);
    }
    /* Special names cases */

    if (specialNameCases.containsKey(element.symbol)) {
      name = "Oxido ${specialNameCases[element.symbol]}$suffix";
    }
    compounds.add(Compound(
      element: element,
      name: name,
      formula: [firstValence, secondValence],
      type: TypeCompound.oxido,
    ));
  }

  return compounds;
}

List<Compound> generatePeroxidoByOneElement(PeriodicTableElement element) {
  final compound = <Compound>[];

  if (element.valencias.isEmpty) {
    return compound;
  }
  if (element.group == Group.monovalente) {
    final firstValence = Valence(
      suffix: element.symbol,
      value: 1,
    );
    final secondValence = Valence(
      suffix: "O",
      value: 2,
    );
    String name = "Peroxido de ${element.name.toLowerCase()}";

    compound.add(Compound(
      element: element,
      name: name,
      formula: [firstValence, secondValence],
      type: TypeCompound.peroxido,
    ));
  }
  if (element.group == Group.bivalente) {
    String name = "Peroxido de ${element.name.toLowerCase()}";
    final firstValence = Valence(
      suffix: element.symbol,
      value: 2,
    );
    final secondValence = Valence(
      suffix: "O",
      value: 2,
    );
    compound.add(Compound(
      element: element,
      name: name,
      formula: [firstValence, secondValence],
      type: TypeCompound.peroxido,
    ));
  }

  /* final valencia =
      element.valencias.first.value == 1 ? "" : element.valencias.first.value;
  String name = "Peroxido de ${element.name.toLowerCase()}";

  name = "Peroxido de ${element.name.toLowerCase()}";
  compound.add(Compound(
    element: element,
    name: name,
    formula: "${element.symbol}${valencia}O${2}",
    type: TypeCompound.peroxido,
  ));
 */
  return compound;
}

List<Compound> generateOxidosDoblesByOneElement(PeriodicTableElement element) {
  final oxidosDoubles = <Compound>[];
  final getOxide = generateOxidosByOneElement(element);
  debugPrint("getOxide $getOxide");
  final name = "Oxido doble de ${getOxide[0].element.name.toLowerCase()}";

  oxidosDoubles.add(Compound(
    element: element,
    name: name,
    formula: sumValences(
      getOxide[0].formula,
      getOxide.length > 1 ? getOxide[1].formula : getOxide[0].formula,
    ),
    type: TypeCompound.oxido_doble,
  ));
  return oxidosDoubles;
}

List<Compound> generateHidroxidosByOneElement(PeriodicTableElement element) {
  return [];
}

List<Compound> generateOxidosByGroupElements(Group group) {
  final elements = filterByGroup(group);
  final compound = <Compound>[];
  elements.forEach((element) {
    compound.addAll(generateOxidosByOneElement(element));
  });
  return compound;
}

List<Compound> generatePeroxidosByGroupElements(Group group) {
  final elements = filterByGroup(group);
  final compound = <Compound>[];
  elements.forEach((element) {
    compound.addAll(generatePeroxidoByOneElement(element));
  });
  return compound;
}

List<Compound> generateOxidosDoblesByGroupElements(Group group) {
  final elements = filterByGroup(group);
  final compound = <Compound>[];
  elements.forEach((element) {
    compound.addAll(generateOxidosDoblesByOneElement(element));
  });
  return compound;
}

List<Compound> generateHidroxidosByGroupElements(Group group) {
  final elements = filterByGroup(group);
  final compound = <Compound>[];
  elements.forEach((element) {
    compound.addAll(generateOxidosDoblesByOneElement(element));
  });
  return compound;
}

List<Compound> generateOxidosByGroupsElements(List<Group> group) {
  return group
      .map((e) => generateOxidosByGroupElements(e))
      .expand((e) => e)
      .toList();
}

List<Compound> generatePerOxidosByGroupsElements(List<Group> group) {
  return group
      .map((e) => generatePeroxidosByGroupElements(e))
      .expand((e) => e)
      .toList();
}

List<Compound> generateOxidosDoblesByGroupsElements(List<Group> group) {
  return group
      .map((e) => generateOxidosDoblesByGroupElements(e))
      .expand((e) => e)
      .toList();
}

List<Compound> generateHidroxidosByGroupsElements(List<Group> group) {
  return group
      .map((e) => generateHidroxidosByGroupElements(e))
      .expand((e) => e)
      .toList();
}
