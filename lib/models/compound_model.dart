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
  /* TODO  hacer la simplififacion en casos cuando el elemento es 4*/
  /* Fix names generated  */
  /* Errors names
            vandiico = vanadio  
            titaniico = titanio  
            mercuriico = mercurio  
            paladiico = paladio  
   */
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
    final elementIsOne =
        valencia.value == 1 || valencia.value == 2 ? "" : valencia.value;
    final suffix = element.valencias.length == 1 ? "" : valencia.suffix.name;
    String name = "";
    final oxideValue = valencia.value == 2 ? "" : 2;
    if (element.valencias.length == 1) {
      name = "Oxido de ${element.name.toLowerCase()}";
    } else {
      /* name = "Oxido ${element.name.toLowerCase().substring(
            0,
            element.name.length - (endInO ? 1:2),
          )}$suffix"; */
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

  final valencia =
      element.valencias.first.value == 1 ? "" : element.valencias.first.value;
  String name = "Peroxido de ${element.name.toLowerCase()}";

  name = "Peroxido de ${element.name.toLowerCase()}";
  compound.add(Compound(
    element: element,
    name: name,
    formula: "${element.symbol}${valencia}O${2}",
    type: TypeCompound.peroxido,
  ));

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

List<Compound> generatePeroxidosByGroupElements(Group group) {
  final elements = filterByGroup(group);
  final compound = <Compound>[];
  elements.forEach((element) {
    compound.addAll(generatePeroxidoByOneElement(element));
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
