part of 'models.dart';

enum Group {
  nullGroup,
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
  final TypeElement typeElement;
  final List<Valencia> valencias;
  PeriodicTableElement({
    required this.name,
    required this.symbol,
    required this.atomicNumber,
    required this.group,
    required this.typeElement,
    required this.valencias,
  });
}
