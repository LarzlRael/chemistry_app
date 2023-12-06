import 'dart:math';

import 'package:flutter/material.dart';
import 'package:templat_project/models/models.dart';

final List<PeriodicTableElement> listPeriodic = [
  PeriodicTableElement(
    typeElement: TypeElement.metal,
    name: 'Hidrógeno',
    symbol: 'H',
    atomicNumber: '1',
    group: Group.monovalente,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
    ],
  ),
  PeriodicTableElement(
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Berilio',
    symbol: 'BE',
    atomicNumber: '',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Cobre',
    symbol: 'Cu',
    atomicNumber: '',
    group: Group.monoBivalente,
  ),
  PeriodicTableElement(
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    name: 'Oro',
    symbol: 'Au',
    atomicNumber: '',
    group: Group.monotrivalente,
  ),
  PeriodicTableElement(
    typeElement: TypeElement.metal,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
    ],
    name: 'Talio',
    symbol: 'Tl',
    atomicNumber: '',
    group: Group.monotrivalente,
  ),
  PeriodicTableElement(
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
    typeElement: TypeElement.metal,
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
  ),
  PeriodicTableElement(
    name: 'Vanadio',
    symbol: 'V',
    atomicNumber: '',
    group: Group.anfotero,
    typeElement: TypeElement.metal,
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
  ),
  PeriodicTableElement(
    name: 'Titanio',
    symbol: 'Ti',
    atomicNumber: '',
    group: Group.anfotero,
    typeElement: TypeElement.metal,
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
  ),
  PeriodicTableElement(
    name: 'Flúor',
    symbol: 'F',
    atomicNumber: '',
    group: Group.halogeno,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: -1,
        suffix: TypeValencia.oso,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Cloro',
    symbol: 'Cl',
    atomicNumber: '',
    group: Group.halogeno,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: -1,
        suffix: TypeValencia.oso,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Bromo',
    symbol: 'Br',
    atomicNumber: '',
    group: Group.halogeno,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.hipo_oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.per_ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Yodo',
    symbol: 'I',
    atomicNumber: '',
    group: Group.halogeno,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.hipo_oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.per_ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Azufre',
    symbol: 'S',
    atomicNumber: '',
    group: Group.anfigenos,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.hipo_oso,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 6,
        suffix: TypeValencia.ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Selenio',
    symbol: 'Se',
    atomicNumber: '',
    group: Group.anfigenos,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.hipo_oso,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 6,
        suffix: TypeValencia.ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Teluro',
    symbol: 'Te',
    atomicNumber: '',
    group: Group.anfigenos,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 2,
        suffix: TypeValencia.hipo_oso,
      ),
      Valencia(
        value: 4,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 6,
        suffix: TypeValencia.ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Nitrogéno',
    symbol: 'Te',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.hipo_oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Fósforo',
    symbol: 'P',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 1,
        suffix: TypeValencia.hipo_oso,
      ),
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Arsénico',
    symbol: 'As',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Antimonio',
    symbol: 'Sb',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.oso,
      ),
      Valencia(
        value: 5,
        suffix: TypeValencia.ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Boro',
    symbol: 'B',
    atomicNumber: '',
    group: Group.nitrogeniodes,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 3,
        suffix: TypeValencia.ico,
      ),
    ],
  ),
  PeriodicTableElement(
    name: 'Carbono',
    symbol: 'C',
    atomicNumber: '',
    group: Group.carbonoides,
    typeElement: TypeElement.no_metal,
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
  ),
  PeriodicTableElement(
    name: 'Silicio',
    symbol: 'Si',
    atomicNumber: '',
    group: Group.carbonoides,
    typeElement: TypeElement.no_metal,
    valencias: [
      Valencia(
        value: 4,
        suffix: TypeValencia.ico,
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

List<PeriodicTableElement> filterByGroup(Group group) {
  if (group == Group.nullGroup) {
    return listPeriodic;
  }
  return listPeriodic.where((element) => element.group == group).toList();
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
    Group.halogeno: Colors.yellow,
    Group.anfigenos: Colors.lightGreen,
    Group.nitrogeniodes: Colors.indigo,
    Group.carbonoides: Colors.brown,
    Group.nullGroup: Colors.grey,
  };

  return groupColors[group] ??
      Colors.black; // Devuelve el color asignado o negro si no hay coincidencia
}
