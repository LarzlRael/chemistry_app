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
    symbol: 'Sn',
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
        suffix: TypeValencia.hipo_oso,
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
    group: Group.anfigeno,
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
    group: Group.anfigeno,
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
    group: Group.anfigeno,
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
    group: Group.nitrogeniode,
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
    group: Group.nitrogeniode,
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
    group: Group.nitrogeniode,
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
    group: Group.nitrogeniode,
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
    group: Group.nitrogeniode,
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
    group: Group.carbonoide,
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
    group: Group.carbonoide,
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

PeriodicTableElement getOneELementBySimbol(
  List<PeriodicTableElement> list,
  String symbol,
) {
  return list.firstWhere(
    (elemento) => elemento.symbol.toLowerCase() == symbol.toLowerCase(),
  );
}

List<PeriodicTableElement> filterByGroup(Group group) {
  if (group == Group.todo) {
    return allListPeriodic;
  }
  return allListPeriodic.where((element) => element.group == group).toList();
}

List<PeriodicTableElement> filterByGroups(List<Group> groups) {
  if (groups.contains(Group.todo)) {
    return allListPeriodic;
  }
  return allListPeriodic
      .where((element) => groups.contains(element.group))
      .toList();
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
    Group.anfigeno: Colors.lightGreen,
    Group.nitrogeniode: Colors.indigo,
    Group.carbonoide: Colors.pinkAccent,
    Group.todo: Colors.grey,
  };

  return groupColors[group] ??
      Colors.black; // Devuelve el color asignado o negro si no hay coincidencia
}

Color colorByGroupIndex(int index) {
  final List<Group> groups = Group.values;

  if (index < 0 || index >= groups.length) {
    return Colors.black; // Manejo de índice fuera de rango
  }

  Group group = groups[index];
  return colorByGroup(group);
}

Color colorByCompoundType(TypeCompound typeCompound) {
  Map<TypeCompound, Color> compoundColors = {
    TypeCompound.oxido: Color(0xff40E0D0),
    TypeCompound.peroxido: Color(0xff5DE9BF),
    TypeCompound.oxido_doble: Color(0xff80F0AA),
    TypeCompound.hidruro: Color(0xffA7F594),
    TypeCompound.hidroxido: Color(0xffCFF880),
    TypeCompound.anhidrido: Color(0xffF9F871),
    TypeCompound.acido_oxacido: Color(0xff40E0D0),
    TypeCompound.acido_polihidratado: Color(0xff00C8E4),
    TypeCompound.ion: Color(0xff00ACEE),
    TypeCompound.oxacido: Color(0xff348AE4),
    TypeCompound.sal_basicas: Color(0xff348AE4),
    TypeCompound.sal_neutra: Color(0xff545479),
    TypeCompound.sal_doble: Color(0xff89B59F),
  };
  return compoundColors[typeCompound] ?? Colors.blue;
}
