part of 'utils.dart';

List<String> separarElementos(String text) {
  RegExp regExp = RegExp(r'([a-zA-Z]+|\d+)');
  Iterable<RegExpMatch> matches = regExp.allMatches(text);
  int counter = 0;
  List<String> elementos = [];
  for (RegExpMatch match in matches) {
    elementos.add(match.group(0)!);
    counter++;
  }

  return elementos;
}

PeriodicTableElement oxidFromElement(PeriodicTableElement element) {
  return PeriodicTableElement(
    atomicNumber: '',
    symbol: "${element.symbol}2O",
    name: "Oxido de ${element.name.toLowerCase()} ",
    group: element.group,
    valencias: element.valencias,
    typeElement: element.typeElement,
  );
}

List<PeriodicTableElement> generateOxidos(List<PeriodicTableElement> elements) {
  List<PeriodicTableElement> oxidos = [];
  elements.forEach((element) {
    oxidos.add(oxidFromElement(element));
  });
  return oxidos;
}

bool hasNumber(String input) {
  // Define una expresión regular que busca un número en el string
  RegExp regex = RegExp(r'\d');

  // Verifica si la expresión regular tiene coincidencias en el string
  return regex.hasMatch(input);
}
