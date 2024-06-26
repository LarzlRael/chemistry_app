part of 'utils.dart';

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

List<Compound> generateHidrurosByGroupsElements(List<Group> group) {
  return group
      .map((e) => generateHidrurosByGroupElements(e))
      .expand((e) => e)
      .toList();
}

List<Compound> generateAnhidridosByGroupsElements(List<Group> group) {
  return group
      .map((e) => generateAnhidridosByGroupElements(e))
      .expand((e) => e)
      .toList();
}

List<Compound> generateAcidosOxacidosByGroupsElements(List<Group> group) {
  return group
      .map((e) => generateAcidosOxacidosByGroupElements(e))
      .expand((e) => e)
      .toList();
}

List<Compound> generateAcidosHidracidosByGroupsElements(List<Group> group) {
  return group
      .map((e) => generateAcidosHidracidosByGroupElements(e))
      .expand((e) => e)
      .toList();
}

List<Compound> generateIonesByGroupsElements(List<Group> group) {
  return group
      .map((e) => generateIonessByGroupElements(e))
      .expand((e) => e)
      .toList();
}

List<PeriodicTableElement> generateMetals(List<Group> group) {
  return group.map((e) => generateELementsByGroup(e)).expand((e) => e).toList();
}
