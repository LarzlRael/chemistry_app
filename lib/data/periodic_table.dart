import 'dart:math';

enum Group {
  monovalente,
  bivalente,
  trivalente,
  monotrivalente,
  bitetravalente,
  bitrivalente,
}

class PeriodicTableElement {
  final String name;
  final String symbol;
  final String atomicNumber;
  final Group group;

  PeriodicTableElement({
    required this.name,
    required this.symbol,
    required this.atomicNumber,
    required this.group,
  });
}

final List<PeriodicTableElement> listPeriodic = [
  PeriodicTableElement(
    name: 'Hidrógeno',
    symbol: 'H',
    atomicNumber: '1',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    name: 'Litio',
    symbol: 'Li',
    atomicNumber: '3',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    name: 'Sodio',
    symbol: 'Na',
    atomicNumber: '11',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    name: 'Potasio',
    symbol: 'K',
    atomicNumber: '19',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    name: 'Rubidio',
    symbol: 'Rb',
    atomicNumber: '37',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    name: 'Cesio',
    symbol: 'Cs',
    atomicNumber: '55',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    name: 'Francio',
    symbol: 'Fr',
    atomicNumber: '87',
    group: Group.monovalente,
  ),
  PeriodicTableElement(
    name: 'Amonio',
    symbol: 'NH4',
    atomicNumber: '', // No es aplicable para iones poliatómicos
    group:
        Group.monovalente, // Puedes asignar el grupo que consideres apropiado
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
