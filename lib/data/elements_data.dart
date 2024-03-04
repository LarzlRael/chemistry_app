class CompoundListElement {
  final String name;
  final String pathImage;
  CompoundListElement({required this.name, required this.pathImage});
}

final compoundMetalList = <CompoundListElement>[
  CompoundListElement(
      name: 'Oxidos', pathImage: 'assets/chemestry/chemestry_2.png'),
  CompoundListElement(
      name: 'Peróxidos', pathImage: 'assets/chemestry/chemestry.png'),
  CompoundListElement(
      name: 'Oxidos dobles', pathImage: 'assets/chemestry/chemestry_3.png'),
  CompoundListElement(
      name: 'Hidroxidos', pathImage: 'assets/chemestry/reaction.png'),
  CompoundListElement(
      name: 'Hidruros', pathImage: 'assets/chemestry/chemestry.png'),
  CompoundListElement(
      name: 'Anhidridos', pathImage: 'assets/chemestry/chemestry_2.png'),
  CompoundListElement(
      name: 'Acidos oxacidos', pathImage: 'assets/chemestry/chemestry_2.png'),
  CompoundListElement(
      name: 'Acidos polihidratos',
      pathImage: 'assets/chemestry/chemestry_2.png'),
  CompoundListElement(
      name: 'Iones', pathImage: 'assets/chemestry/chemestry_2.png'),
  CompoundListElement(
      name: 'Sales neutras', pathImage: 'assets/chemestry/chemestry_2.png'),
];
/* final compoundNoMetalList = <CompoundListElement>[]; */

CompoundListElement findCompoundCardByName(String name) {
  return compoundMetalList.firstWhere((element) => element.name == name);
}
