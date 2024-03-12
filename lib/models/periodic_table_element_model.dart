// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'models.dart';

enum Group {
  todo,
  monovalente,
  bivalente,
  trivalente,
  monotrivalente,
  bitetravalente,
  bitrivalente,
  monoBivalente,
  anfotero,
  halogeno,
  anfigenos,
  nitrogeniodes,
  carbonoides,
}

enum TypeValencia {
  ico,
  oso,
  hipo_oso,
  per_ico,
}

enum TypeElement {
  metal,
  no_metal,
  metaloide,
}

class Valencia {
  final int value;
  final TypeValencia suffix;
  final TypeElement? typeElement;
  Valencia({
    required this.value,
    required this.suffix,
    this.typeElement = TypeElement.metal,
  });
}

class PeriodicTableElement {
  final String name;
  final String symbol;
  final String atomicNumber;
  final Group group;

  final List<Valencia> valencias;
  PeriodicTableElement({
    required this.name,
    required this.symbol,
    required this.atomicNumber,
    required this.group,
    required this.valencias,
  });

  PeriodicTableElement copyWith({
    String? name,
    String? symbol,
    String? atomicNumber,
    Group? group,
    TypeElement? typeElement,
    List<Valencia>? valencias,
  }) {
    return PeriodicTableElement(
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      atomicNumber: atomicNumber ?? this.atomicNumber,
      group: group ?? this.group,
      valencias: valencias ?? this.valencias,
    );
  }
}

final metalGroup = <Group>[
  Group.monovalente,
  Group.bivalente,
  Group.trivalente,
  Group.monoBivalente,
  Group.monotrivalente,
  Group.bitetravalente,
  Group.bitrivalente,
  Group.anfotero,
];

final noMetalGroup = <Group>[
  Group.halogeno,
  Group.anfigenos,
  Group.nitrogeniodes,
  Group.carbonoides,
  Group.anfotero,
];
