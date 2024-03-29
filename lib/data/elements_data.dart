import 'package:templat_project/models/models.dart';

class CompoundListElement {
  final String name;
  final String pathImage;
  final TypeCompound type;
  CompoundListElement({
    required this.name,
    required this.pathImage,
    required this.type,
  });
}

final compoundMetalList = <CompoundListElement>[
  CompoundListElement(
    name: 'Oxidos',
    pathImage: 'assets/chemestry/chemestry_2.png',
    type: TypeCompound.oxido,
  ),
  CompoundListElement(
    name: 'Peróxidos',
    pathImage: 'assets/chemestry/chemestry.png',
    type: TypeCompound.peroxido,
  ),
  CompoundListElement(
    name: 'Oxidos dobles',
    pathImage: 'assets/chemestry/chemestry_3.png',
    type: TypeCompound.oxido_doble,
  ),
  CompoundListElement(
    name: 'Hidroxidos',
    pathImage: 'assets/chemestry/reaction.png',
    type: TypeCompound.hidroxido,
  ),
  CompoundListElement(
    name: 'Hidruros',
    pathImage: 'assets/chemestry/chemestry.png',
    type: TypeCompound.hidruro,
  ),
  CompoundListElement(
    name: 'Anhidridos',
    pathImage: 'assets/chemestry/chemestry_2.png',
    type: TypeCompound.anhidrido,
  ),
  CompoundListElement(
    name: 'Acidos oxacidos',
    pathImage: 'assets/chemestry/acidos_ox.png',
    type: TypeCompound.acido_oxacido,
  ),
  CompoundListElement(
    name: 'Acidos polihidratos',
    pathImage: 'assets/chemestry/acidos_pol.png',
    type: TypeCompound.acido_polihidratado,
  ),
  CompoundListElement(
    name: 'Iones',
    pathImage: 'assets/chemestry/ion.png',
    type: TypeCompound.ion,
  ),
  CompoundListElement(
    name: 'Sales neutras',
    pathImage: 'assets/chemestry/sales_neu.png',
    type: TypeCompound.sal_neutra,
  ),
];

CompoundListElement findCompoundCardByName(TypeCompound name) {
  return compoundMetalList.firstWhere((element) => element.type == name);
}
