part of 'utils.dart';

List<String> separarElementos(String texto) {
  RegExp regExp = RegExp(r'([a-zA-Z]+|\d+)');
  Iterable<RegExpMatch> matches = regExp.allMatches(texto);
  int counter = 0;
  List<String> elementos = [];
  for (RegExpMatch match in matches) {
    /* if (counter == 0) {
        elementos.add(match.group(0)!.toUpperCase());
      } else {
      } */
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
