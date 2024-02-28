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

bool hasNumber(String input) {
  // Define una expresión regular que busca un número en el string
  RegExp regex = RegExp(r'\d');

  // Verifica si la expresión regular tiene coincidencias en el string
  return regex.hasMatch(input);
}

List<Valence> sumValences(List<Valence> valences1, List<Valence> valences2) {
  Map<String, int> suffixValueMap = {};

  // Sumar los valores para los sufijos correspondientes
  for (var valence in valences1) {
    suffixValueMap.update(valence.suffix, (value) => value + valence.value,
        ifAbsent: () => valence.value);
  }

  for (var valence in valences2) {
    suffixValueMap.update(valence.suffix, (value) => value + valence.value,
        ifAbsent: () => valence.value);
  }

  // Convertir el mapa de sufijo-valor nuevamente a una lista de Valence
  List<Valence> result = suffixValueMap.entries
      .map((entry) => Valence(suffix: entry.key, value: entry.value))
      .toList();

  return result;
}

/*  */
bool hasNonMetalValence(PeriodicTableElement element) {
  for (var valence in element.valencias) {
    if (valence.typeElement == TypeElement.no_metal) {
      return true;
    }
  }
  return false;
}

String isOne(String text) {
  return text.length == 1 ? text : '';
}

String getValenceString(List<Valence> valences) {
  final val =
      valences.map((valence) => '${valence.suffix}${valence.value}').join('');
  if (val.contains("1")) {
    return val.replaceAll("1", "");
  }
  return val;
}

List<Valence> simplifyValences(Valence first, Valence second) {
  /* simplificar si es el segudo elemento es 4 o  2 */
  /* cuando ambos son iguales */
  if (first.value == second.value) {
    return [
      first.copyWith(value: 1),
      second.copyWith(value: 1),
    ];
  }
  /* cuando uno es 2 y el otro es 4 */
  if (first.value == 2 && second.value == 4) {
    return [
      first.copyWith(value: 1),
      second.copyWith(value: 2),
    ];
  }
  return [first, second];
}
