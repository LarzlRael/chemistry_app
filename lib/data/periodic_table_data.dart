import 'dart:math';

import 'package:flutter/material.dart';
import 'package:templat_project/models/models.dart';

final List<PeriodicTableElement> allListPeriodic = [
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Litio',
    symbol: 'Li',
    atomicNumber: '3',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Sodio',
    symbol: 'Na',
    atomicNumber: '11',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Potasio',
    symbol: 'K',
    atomicNumber: '19',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Rubidio',
    symbol: 'Rb',
    atomicNumber: '37',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Cesio',
    symbol: 'Cs',
    atomicNumber: '55',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Plata',
    symbol: 'Ag',
    atomicNumber: '47',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Francio',
    symbol: 'Fr',
    atomicNumber: '87',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Amonio',
    symbol: 'NH4',
    atomicNumber: '', // No es aplicable para iones poliatómicos
    group:
        Group.monovalente, // Puedes asignar el grupo que consideres apropiado
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Berilio',
    symbol: 'Be',
    atomicNumber: '',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Magnesio',
    symbol: 'Mg',
    atomicNumber: '12',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Calcio',
    symbol: 'Ca',
    atomicNumber: '20',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Estroncio',
    symbol: 'Sr',
    atomicNumber: '38',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Bario',
    symbol: 'Ba',
    atomicNumber: '56',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Radio',
    symbol: 'Ra',
    atomicNumber: '88',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Zinc',
    symbol: 'Zn',
    atomicNumber: '30',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Cadmio',
    symbol: 'Cd',
    atomicNumber: '48',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Aluminio',
    symbol: 'Al',
    atomicNumber: '13',
    group: Group.trivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Galio',
    symbol: 'Ga',
    atomicNumber: '31',
    group: Group.trivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Indio',
    symbol: 'In',
    atomicNumber: '49',
    group: Group.trivalente,
  ),
  PeriodicTableElement(
    name: 'Cobre',
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 2,
        suffix: TypeValencia.ico,
      ),
    ],
    symbol: 'Cu',
    atomicNumber: '',
    group: Group.monoBivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 2,
        suffix: TypeValencia.ico,
      ),
    ],
    name: 'Mercurio',
    symbol: 'Hg',
    atomicNumber: '',
    group: Group.monoBivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
    ],
    name: 'Oro',
    symbol: 'Au',
    atomicNumber: '',
    group: Group.monotrivalente,
  ),
  PeriodicTableElement(
    name: 'Talio',
    symbol: 'Tl',
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
    ],
    atomicNumber: '',
    group: Group.monotrivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
    ],
    name: 'Hierro',
    symbol: 'Fe',
    atomicNumber: '',
    group: Group.bitrivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
    ],
    name: 'Cobalto',
    symbol: 'Co',
    atomicNumber: '',
    group: Group.bitrivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
    ],
    name: 'Níquel',
    symbol: 'Ni',
    atomicNumber: '',
    group: Group.bitrivalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.ico,
      ),
    ],
    name: 'Estaño',
    symbol: 'SN',
    atomicNumber: '',
    group: Group.bitetravalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.ico,
      ),
    ],
    name: 'Plomo',
    symbol: 'Pb',
    atomicNumber: '',
    group: Group.bitetravalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.ico,
      ),
    ],
    name: 'Paladio',
    symbol: 'Pd',
    atomicNumber: '',
    group: Group.bitetravalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.ico,
      ),
    ],
    name: 'Platino',
    symbol: 'Pt',
    atomicNumber: '',
    group: Group.bitetravalente,
  ),
  PeriodicTableElement(
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 6,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 7,
        suffix: TypeValencia.per_ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
    name: 'Manganeso',
    symbol: 'Mn',
    atomicNumber: '',
    group: Group.anfotero,
  ),
  PeriodicTableElement(
    name: 'Cromo',
    symbol: 'Cr',
    atomicNumber: '',
    group: Group.anfotero,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
      Valencia(
        value: 6,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Vanadio',
    symbol: 'V',
    atomicNumber: '',
    group: Group.anfotero,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Bismuto',
    symbol: 'Bi',
    atomicNumber: '',
    group: Group.anfotero,
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Titanio',
    symbol: 'Ti',
    atomicNumber: '',
    group: Group.anfotero,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Flúor',
    symbol: 'F',
    atomicNumber: '',
    group: Group.halogeno,
    valencias: [
      Valencia(
        value: -1,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Cloro',
    symbol: 'Cl',
    atomicNumber: '',
    group: Group.halogeno,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.hipo_oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 7,
        suffix: TypeValencia.per_ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Bromo',
    symbol: 'Br',
    atomicNumber: '',
    group: Group.halogeno,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.hipo_oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 7,
        suffix: TypeValencia.per_ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Yodo',
    symbol: 'I',
    atomicNumber: '',
    group: Group.halogeno,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.hipo_oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 7,
        suffix: TypeValencia.per_ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Azufre',
    symbol: 'S',
    atomicNumber: '',
    group: Group.anfigenos,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.hipo_oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 6,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Selenio',
    symbol: 'Se',
    atomicNumber: '',
    group: Group.anfigenos,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.hipo_oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 6,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Teluro',
    symbol: 'Te',
    atomicNumber: '',
    group: Group.anfigenos,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.hipo_oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 6,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Nitrogéno',
    symbol: 'N',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.hipo_oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Fósforo',
    symbol: 'P',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.hipo_oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Arsénico',
    symbol: 'As',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Antimonio',
    symbol: 'Sb',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Boro',
    symbol: 'B',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Carbono',
    symbol: 'C',
    atomicNumber: '',
    group: Group.carbonoides,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
        typeElement: TypeElement.no_metal,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Silicio',
    symbol: 'Si',
    atomicNumber: '',
    group: Group.carbonoides,
    valencias: [
      Valencia(
        value: 4,
        suffix: TypeValencia.ico,
        typeElement: TypeElement.no_metal,
      ),
    ],
  )
];

List<PeriodicTableElement> shuffleList(
    List<PeriodicTableElement> originalList) {
  List<PeriodicTableElement> shuffledList = List.from(originalList);
  final Random random = Random();

  for (int i = shuffledList.length - 1; i > 0; i--) {
    int randIndex = random.nextInt(i + 1);

    // Swap elements
    PeriodicTableElement temp = shuffledList[i];
    shuffledList[i] = shuffledList[randIndex];
    shuffledList[randIndex] = temp;
  }

  return shuffledList;
}

List<PeriodicTableElement> getElementsBySimbols(
  List<PeriodicTableElement> list,
  List<String> symbols,
) {
  return symbols
      .map((simbolo) => list.firstWhere(
            (elemento) =>
                elemento.symbol.toLowerCase() == simbolo.toLowerCase(),
          ))
      .toList();
}

PeriodicTableElement getOneELement(
  List<PeriodicTableElement> list,
  String symbol,
) {
  return list.firstWhere(
    (elemento) => elemento.symbol.toLowerCase() == symbol.toLowerCase(),
  );
}

List<PeriodicTableElement> filterByGroup(Group group) {
  if (group == Group.nullGroup) {
    return allListPeriodic;
  }
  return allListPeriodic.where((element) => element.group == group).toList();
}

Color colorByGroup(Group group) {
  final Map<Group, Color> groupColors = {
    Group.monovalente: Colors.red,
    Group.bivalente: Colors.orange,
    Group.trivalente: Colors.blue,
    Group.monotrivalente: Colors.purple,
    Group.bitetravalente: Colors.pink,
    Group.bitrivalente: Colors.orange,
    Group.monoBivalente: Colors.green,
    Group.anfotero: Colors.teal,
    Group.halogeno: Colors.pinkAccent,
    Group.anfigenos: Colors.lightGreen,
    Group.nitrogeniodes: Colors.indigo,
    Group.carbonoides: Colors.brown,
    Group.nullGroup: Colors.grey,
  };

  return groupColors[group] ??
      Colors.black; // Devuelve el color asignado o negro si no hay coincidencia
}

Color colorByCompoundType(TypeCompound typeCompound) {
  Map<TypeCompound, Color> compoundColors = {
    TypeCompound.oxido: Colors.indigo,
    TypeCompound.peroxido: Colors.blue,
    TypeCompound.oxido_doble: Colors.brown,
    TypeCompound.hidruro: Colors.cyan,
    TypeCompound.hidroxido: Colors.green,
    TypeCompound.anhidrido: Colors.pink,
    TypeCompound.acido_oxacido: Colors.orange,
    TypeCompound.acido_polihidratado: Colors.amber,
    TypeCompound.ion: Colors.purple,
    TypeCompound.oxoacido: Colors.teal,
  };
  return compoundColors[typeCompound] ?? Colors.blue;
}
