part of 'utils.dart';

List<PeriodicTableElement> searchElements(
  List<PeriodicTableElement> elements,
  String query,
) {
  // Filtrar por nombre o símbolo que coincida con la consulta
  return elements
      .where(
        (element) =>
            element.name.toLowerCase().contains(query.toLowerCase()) ||
            /* element.value!.toLowerCaNse().contains(query.toLowerCase())  ||*/
            element.symbol.toLowerCase().contains(query.toLowerCase()),
      )
      .toList();
}
