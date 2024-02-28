part of 'utils.dart';

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
    compound.addAll(generateHidroxidosByOneElement(element));
  });
  return compound;
}

List<Compound> generateHidrurosByGroupElements(Group group) {
  final elements = filterByGroup(group);
  final compound = <Compound>[];
  elements.forEach((element) {
    compound.addAll(generateHidrurosByOneElement(element));
  });
  return compound;
}

List<Compound> generateAnhidridosByGroupElements(Group group) {
  final elements = filterByGroup(group);
  final compound = <Compound>[];
  elements.forEach((element) {
    compound.addAll(generateAnhidridosByOneElement(element));
  });
  return compound;
}
