import 'dart:math';

import 'package:flutter/material.dart';

enum Group {
  nullGroup,
  monovalente,
  bivalente,
  trivalente,
  monotrivalente,
  bitetravalente,
  bitrivalente,
  monoBivalente,
}

class PeriodicTableElement {
  final String name;
  final String symbol;
  final String atomicNumber;
  final Group group;
  final String? value;

  PeriodicTableElement({
    required this.name,
    required this.symbol,
    required this.atomicNumber,
    required this.group,
    required this.value,
  });
}

final List<PeriodicTableElement> listPeriodic = [
  PeriodicTableElement(
    value: '1',
    name: 'Hidrógeno',
    symbol: 'H',
    atomicNumber: '1',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    value: '1',
    name: 'Litio',
    symbol: 'Li',
    atomicNumber: '3',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    value: '1',
    name: 'Sodio',
    symbol: 'Na',
    atomicNumber: '11',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    value: '1',
    name: 'Potasio',
    symbol: 'K',
    atomicNumber: '19',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    value: '1',
    name: 'Rubidio',
    symbol: 'Rb',
    atomicNumber: '37',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    value: '1',
    name: 'Cesio',
    symbol: 'Cs',
    atomicNumber: '55',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    value: '1',
    name: 'Francio',
    symbol: 'Fr',
    atomicNumber: '87',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    value: '1',
    name: 'Amonio',
    symbol: 'NH4',
    atomicNumber: '', // No es aplicable para iones poliatómicos
    group:
        Group.monovalente, // Puedes asignar el grupo que consideres apropiado
  ),
  PeriodicTableElement(
    value: '2',
    name: 'Berilio',
    symbol: 'BE',
    atomicNumber: '',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    value: '2',
    name: 'Magnesio',
    symbol: 'Mg',
    atomicNumber: '12',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    value: '2',
    name: 'Calcio',
    symbol: 'Ca',
    atomicNumber: '20',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    value: '2',
    name: 'Estroncio',
    symbol: 'Sr',
    atomicNumber: '38',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    value: '2',
    name: 'Bario',
    symbol: 'Ba',
    atomicNumber: '56',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    value: '2',
    name: 'Radio',
    symbol: 'Ra',
    atomicNumber: '88',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    value: '2',
    name: 'Zinc',
    symbol: 'Zn',
    atomicNumber: '30',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    value: '2',
    name: 'Cadmio',
    symbol: 'Cd',
    atomicNumber: '48',
    group: Group.bivalente,
  ),
  PeriodicTableElement(
    value: '3',
    name: 'Aluminio',
    symbol: 'Al',
    atomicNumber: '13',
    group: Group.trivalente,
  ),
  PeriodicTableElement(
    value: '3',
    name: 'Galio',
    symbol: 'Ga',
    atomicNumber: '31',
    group: Group.trivalente,
  ),
  PeriodicTableElement(
    value: '3',
    name: 'Indio',
    symbol: 'In',
    atomicNumber: '49',
    group: Group.trivalente,
  ),
  PeriodicTableElement(
    value: '1 y 2',
    name: 'Cobre',
    symbol: 'Cu',
    atomicNumber: '',
    group: Group.monoBivalente,
  ),
  PeriodicTableElement(
    value: '1 y 2',
    name: 'Mercurio',
    symbol: 'Hg',
    atomicNumber: '',
    group: Group.monoBivalente,
  ),
  PeriodicTableElement(
    value: '2 y 3',
    name: 'Oro',
    symbol: 'Au',
    atomicNumber: '',
    group: Group.monotrivalente,
  ),
  PeriodicTableElement(
    value: '1 y 3',
    name: 'Talio',
    symbol: 'Tl',
    atomicNumber: '',
    group: Group.monotrivalente,
  ),
  PeriodicTableElement(
    value: '2 y 3',
    name: 'Hierro',
    symbol: 'Fe',
    atomicNumber: '',
    group: Group.bitrivalente,
  ),
  PeriodicTableElement(
    value: '2 y 3',
    name: 'Cobalto',
    symbol: 'Co',
    atomicNumber: '',
    group: Group.bitrivalente,
  ),
  PeriodicTableElement(
    value: '2 y 3',
    name: 'Níquel',
    symbol: 'Ni',
    atomicNumber: '',
    group: Group.bitrivalente,
  ),
  PeriodicTableElement(
    value: '2 y 4',
    name: 'Estaño',
    symbol: 'SN',
    atomicNumber: '',
    group: Group.bitetravalente,
  ),
  PeriodicTableElement(
    value: '2 y 4',
    name: 'Plomo',
    symbol: 'Pb',
    atomicNumber: '',
    group: Group.bitetravalente,
  ),
  PeriodicTableElement(
    value: '2 y 4',
    name: 'Paladio',
    symbol: 'Pd',
    atomicNumber: '',
    group: Group.bitetravalente,
  ),
  PeriodicTableElement(
    value: '2 y 4',
    name: 'Platino',
    symbol: 'Pt',
    atomicNumber: '',
    group: Group.bitetravalente,
  ),
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
  switch (group) {
    case Group.monovalente:
      return Colors.red;
    case Group.bivalente:
      return Colors.orange;
    case Group.trivalente:
      return Colors.blue;
    case Group.monotrivalente:
      return Colors.purple;
    case Group.bitetravalente:
      return Colors.pink;
    case Group.bitrivalente:
      return Colors.orange;
    case Group.nullGroup:
      return Colors.grey;
    default:
      return Colors.black;
  }
}
