part of 'utils.dart';

List<String> separarElementos(String text) {
  RegExp regExp = RegExp(r'-?\d+|[a-zA-Z]+');
  Iterable<RegExpMatch> matches = regExp.allMatches(text);

  List<String> elementos = [];
  for (RegExpMatch match in matches) {
    elementos.add(match.group(0)!);
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

bool hasBothTypes(List<Valencia> valencias) {
  bool hasMetal = false;
  bool hasNonMetal = false;

  for (var valencia in valencias) {
    if (valencia.typeElement == TypeElement.metal) {
      hasMetal = true;
    } else if (valencia.typeElement == TypeElement.no_metal) {
      hasNonMetal = true;
    }

    if (hasMetal && hasNonMetal) return true;
  }

  return hasMetal && hasNonMetal;
}

bool isAllSameType(List<Valencia> valencias) {
  if (valencias.isEmpty) {
    return false; // Si la lista está vacía, no se puede determinar el tipo
  }

  TypeElement? primerTipo = valencias.first.typeElement;
  for (var valencia in valencias) {
    if (valencia.typeElement != primerTipo) {
      return false; // Si encontramos un tipo diferente, no todos son del mismo tipo
    }
  }
  return true; // Si llegamos hasta aquí, todos los tipos son iguales
}

String isOne(String text) {
  return text.length == 1 ? text : '';
}

String getValenceString(List<Valence> valences) =>
/* TODO add () parentesis a los elemtnso quesean necesarios */
    valences.map((valence) => '${valence.suffix}${valence.value}').join('');

List<Valence> simplify(List<Valence> arr) {
  List<Valence> simplifiedList = [];

  for (Valence val in arr) {
    if (val.value % 2 == 0) {
      double result = val.value / 2;
      simplifiedList.add(val.copyWith(value: result.toInt()));
    } else {
      simplifiedList = List.from(arr);
      break;
    }
  }

  return simplifiedList;
}

List<String> splitString(String string, String spliter) {
  return string.split(spliter);
}

isEven(int number) {
  return number % 2 == 0;
}

String isEspecialCase(String symbol, Map<String, String> specialCaseList) {
  if (specialCaseList.containsKey(symbol)) {
    return specialCaseList[symbol]!;
  }
  return symbol;
}
/* List<Valence> simplifyAcidos(
    Valence firstValence, Valence secondValence, Valence thirdValence) {
  if (isEven(thirdValence.value)) {
    return [firstValence, secondValence];
  }
} */

int concatValencesValues(List<Valence> valencias) {
  // Concatenar los números en una cadena
  String numerosConcatenados =
      valencias.map((valencia) => valencia.value).join('');

  // Convertir la cadena en un entero y devolverlo
  return int.parse(numerosConcatenados);
}

List<PeriodicTableElement> filterValences(
    List<PeriodicTableElement> elements, List<int> indexes) {
  // Crear una nueva lista para almacenar los elementos filtrados
  List<PeriodicTableElement> elementosFiltrados = [];

  // Iterar sobre cada elemento y verificar si su índice está presente en la lista de números
  for (int i = 0; i < elements.length; i++) {
    if (indexes.contains(i)) {
      // Si el índice está presente, agregar el elemento a la lista filtrada
      elementosFiltrados.add(elements[i]);
    }
  }

  return elementosFiltrados;
}

PeriodicTableElement filterValencias(
    PeriodicTableElement element, List<int> indices) {
  // Filtrar las valencias según los índices proporcionados
  final filteredValencias = element.valencias
      .where((valencia) => indices.contains(valencia.value))
      .toList();

  // Crear una copia del objeto PeriodicTableElement con las valencias filtradas
  return element.copyWith(valencias: filteredValencias);
}

List<Valence> moveFirstElementToLastPosition(List<Valence> lista) {
  if (lista.isNotEmpty) {
    Valence primerElemento =
        lista.removeAt(0); // Elimina y guarda el primer elemento
    lista.add(primerElemento); // Agrega el primer elemento al final de la lista
  }
  return lista;
}

String remplazeOsoIco(String texto) {
  RegExp regExp = RegExp(r'(oso|ico)$');

  return texto.replaceAllMapped(regExp, (match) {
    switch (match.group(0)) {
      case 'oso':
        return 'ito';
      case 'ico':
        return 'ato';
      default:
        return match.group(0)!;
    }
  });
}
