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

List<Compound> generateOxidosByOneElement(PeriodicTableElement elements) {
  final compound = <Compound>[];
  if (elements.valencias.isEmpty) {
    return compound;
  }

  if (elements.valencias.length > 1) {
    compound.add(Compound(
      element: elements,
      /* TODO  name ferrico and ferroso*/
      name: "Oxido de ${elements.name.toLowerCase()}",
      formula: elements.symbol.toLowerCase() == "nh4"
          ? "${elements.symbol}(${elements.valencias[0].value})O"
          : "${elements.symbol}${elements.valencias[0].value}O",
      type: "Oxido",
    ));
    return compound;
  }
  elements.valencias.forEach((valencia) {
    final element = valencia.value == 1 ? "" : valencia.value;
    compound.add(Compound(
      element: elements,
      name: "Oxido de ${elements.name.toLowerCase()}",
      formula: "${elements.symbol}${2}O${element}",
      type: "Oxido",
    ));
  });
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
