class CompoundListElement {
  final String name;
  final String pathImage;
  CompoundListElement({required this.name, required this.pathImage});
}

final compoundList = <CompoundListElement>[
  CompoundListElement(
      name: 'Oxidos', pathImage: 'assets/chemestry/chemestry_2.png'),
  CompoundListElement(
      name: 'Peróxidos', pathImage: 'assets/chemestry/chemestry.png'),
  CompoundListElement(
      name: 'Oxidos dobles', pathImage: 'assets/chemestry/chemestry_3.png'),
];

CompoundListElement findCompoundCardByName(String name) {
  return compoundList.firstWhere((element) => element.name == name);
}
