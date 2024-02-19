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
    String name = "";
    if (element.valencias.length == 1) {
      name = "Oxido de ${element.name.toLowerCase()}";
    } else {
      name = "Oxido ${element.name.toLowerCase().substring(
            0,
            element.name.length - 1,
          )}$suffix";
    }
    if (element.name.contains("oro")) {
      name = "Oxido aur${suffix}";
    }
    compound.add(Compound(
      element: element,
      name: name,
      formula: hasNumber(element.symbol)
          ? "\\(${element.symbol}\\)${2}O$elementIsOne"
          : "${element.symbol}${2}O$elementIsOne",
      type: "Oxido",
    ));
  }

  return compound;
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
    type: "Peroxido",
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
