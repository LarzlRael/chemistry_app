part of 'models.dart';

enum TypeCompound {
  oxido,
  peroxido,
  hidroxido,
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
  final String formula;
  final TypeCompound type;
  Compound({
    required this.element,
    required this.name,
    required this.formula,
    required this.type,
  });
}

List<Compound> generateOxidosByOneElement(PeriodicTableElement element) {
  /* TODO  hacer la simplififacion en casos cuando el elemento es 4*/
  final oxideValue = 2;
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
    const OXIDE_VALUE = 2;
    final elementIsOne = valencia.value == 1 ? "" : valencia.value;
    int elementValue = valencia.value;

    /* get oso or ico */
    final suffix = element.valencias.length == 1 ? "" : valencia.suffix.name;
    String name = "";
    int oxideValue = 0;
    if (elementValue % OXIDE_VALUE == 0) {
      if (elementValue % 2 == 0) {
        oxideValue = elementValue ~/ OXIDE_VALUE;
        elementValue = elementValue ~/ OXIDE_VALUE;
      } else {
        oxideValue = elementValue;
      }
    }
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
      formula: "${element.symbol}$oxideValue O$elementIsOne",
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
    String name = "Peroxido de ${element.name.toLowerCase()}";

    compound.add(Compound(
      element: element,
      name: name,
      formula: "${element.symbol}2O${2}",
      type: TypeCompound.peroxido,
    ));
  }
  if (element.group == Group.bivalente) {
    String name = "Peroxido de ${element.name.toLowerCase()}";

    compound.add(Compound(
      element: element,
      name: name,
      formula: "${element.symbol}O${2}",
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
  getOxide.asMap().forEach((index, element) {
    if (index == getOxide.length - 1) {
      final name = "Oxido doble de ${element.name.toLowerCase()}";
      final formula = "${element.formula}2";
      oxidosDoubles.add(Compound(
        element: element.element,
        name: name,
        formula: formula,
        type: TypeCompound.oxido,
      ));
    }
  });
  return oxidosDoubles;
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
