part of 'utils.dart';

List<String> splitStringIntoCharacters(String input) {
  List<String> characters = [];
  bool mergeNext = false; // Indica si se debe unir el siguiente carácter

  for (int i = 0; i < input.length; i++) {
    if (mergeNext) {
      // Si se debe unir el siguiente carácter
      characters.add(
          '${input[i - 1]}${input[i]}'); // Se agrega el signo junto con el número siguiente
      mergeNext = false; // Se resetea el indicador
    } else if (input[i] == '-') {
      // Si el carácter actual es un signo negativo
      mergeNext =
          true; // Se indica que el siguiente carácter debe unirse con este
    } else {
      characters.add(input[i]); // Se agrega el carácter actual
    }
  }
  /* if (int.parse(characters.last).isNaN && int.parse(characters.last) > 0) {
    characters.add(')');
  }
 */

  characters.removeWhere((element) => element == '1' || element == '0');
  return characters;
}

/* List<String> setArrayStringFormula(
  List<ValenceCompound> valences, {
  TypeCompound? typeCompound,
}) {
  /* TODO here all cases names */
  return valences
      .map((valence) => valence.concatValenceCompound())
      .expand((element) => element)
      .toList();
} */

bool hasNumber(String input) {
  // Define una expresión regular que busca un número en el string
  RegExp regex = RegExp(r'\d');

  // Verifica si la expresión regular tiene coincidencias en el string
  return regex.hasMatch(input);
}

List<ValenceCompound> sumValences(
    List<ValenceCompound> valences1, List<ValenceCompound> valences2) {
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
  List<ValenceCompound> result = suffixValueMap.entries
      .map((entry) => ValenceCompound(suffix: entry.key, value: entry.value))
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

String getValenceString(
  List<ValenceCompound> valences, {
  TypeCompound? typeCompound,
}) {
  if (typeCompound == TypeCompound.ion) {
    String str =
        valences.map((valence) => valence.concatValenceCompound()).toString();
    int posicionGuion = str.indexOf('-');

    // Extrae la parte antes del guion y la parte después del guion
    String parteAntesGuion = str.substring(0, posicionGuion);
    String parteDespuesGuion = str.substring(posicionGuion);

    // Agrega paréntesis alrededor de la parte antes del guion y luego une con la parte después del guion
    String resultado = '($parteAntesGuion)$parteDespuesGuion';

    return resultado;
  }
  if (typeCompound == TypeCompound.hidroxido) {
    final elementName = valences.map((valence) => valence.toString()).join('');
    return elementName.replaceAll(RegExp('OH'), '(OH)');
  }
  if (typeCompound == TypeCompound.sal_neutra) {
    if (valences.last.value == 1) {
      return valences.map((valence) => valence.toString()).join('');
    }
    final elementName = valences.mapIndexed((i, valence) {
      if (i == 0) {
        return valence.toString() + '(';
      }
      if (i == valences.length - 2) {
        return valence.toString() + ')';
      }
      return valence.toString();
    }).join('');
    return elementName;
  }

  return valences.map((valence) => valence.toString()).join('');
}

List<ValenceCompound> simplify(List<ValenceCompound> arr) {
  List<ValenceCompound> simplifiedList = [];

  for (ValenceCompound val in arr) {
    if (val.value % 2 == 0) {
      double result = val.value / 2;
      simplifiedList.add(val.copyWith(
        value: result.toInt(),
        isSimplified: true,
      ));
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

String isSpecialCase(String symbol, Map<String, String> specialCaseList) {
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

int concatValencesValues(List<ValenceCompound> valencias) {
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

List<ValenceCompound> moveFirstElementToLastPosition(
  List<ValenceCompound> lista,
) {
  final tempList =
      List<ValenceCompound>.from(lista); // Hacer una copia de la lista original
  if (tempList.isNotEmpty) {
    ValenceCompound primerElemento =
        tempList.removeAt(0); // Elimina y guarda el primer elemento
    tempList.add(
        primerElemento); // Agrega el primer elemento al final de la tempList
  }
  tempList[0] = tempList[0].copyWith(
    suffix: "(" + tempList[0].suffix,
  );
  return tempList;
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

String salNeutraName(
    PeriodicTableElement periodicTableElement, Valencia valence) {
  final name = periodicTableElement.name.toLowerCase();
  final valenceSuffix = valence.suffix.name;

  if (periodicTableElement.valencias.length == 1) {
    return " de $name";
  }
  if (specialNamesCases.containsKey(periodicTableElement.symbol)) {
    return " ${specialNamesCases[periodicTableElement.symbol]}$valenceSuffix";
  }
  return " ${name.substring(0, name.length - 1)}$valenceSuffix";
}

String getValueOrSame(String key, String defaultValue) {
  return specialNamesCases[key] ?? defaultValue;
}

String setAnhidridoName(
    PeriodicTableElement periodicTableElement, Valencia valence) {
  if (periodicTableElement.symbol == "F") {
    return "$anhidridoName de fluor";
  }
  if (specialNamesCases.containsKey(periodicTableElement.symbol)) {
    return "$anhidridoName ${specialNamesCases[periodicTableElement.symbol]}${valence.suffix.name}";
  }
  if (valence.suffix == TypeValencia.ico ||
      valence.suffix == TypeValencia.oso) {
    return "$anhidridoName ${periodicTableElement.name.toLowerCase().substring(
          0,
          periodicTableElement.name.length - 1,
        )}${valence.suffix.name}";
  }

  return "$anhidridoName de ${periodicTableElement.name.toLowerCase()}";
}

String setAnhidridoHipoOsoName(
    PeriodicTableElement periodicTableElement, Valencia valence) {
  final split = splitString(valence.suffix.name, "_");
  String name = '';

  if (specialNamesCases.containsKey(periodicTableElement.symbol)) {
    name =
        "$anhidridoName ${split[0]}${specialNamesCases[periodicTableElement.symbol]}${split[1]}";
  } else {
    name =
        "$anhidridoName ${split[0]}${periodicTableElement.name.toLowerCase().substring(
              0,
              periodicTableElement.name.length - 1,
            )}${split[1]}";
  }

  return name;
}

String changeAcidoName(String name, String symbol) {
  final special = {
    'B': 'borico',
    'Si': 'silicico',
  };
  if (special.containsKey(symbol)) {
    return "Acido ${special[symbol]}";
  }
  return name.replaceFirst(anhidridoName, "Acido");
}

final mapMetaPiroOrto = {
  1: "meta",
  2: "piro",
  3: "orto",
};
final mapMetaPiroOrtoReverse = {
  "meta": 1,
  "piro": 2,
  "orto": 3,
};

String acidoPolihidracidoName(String acidoName, int oxigenoValue) {
  // Dividir la palabra en dos partes
  List<String> partes = acidoName.split(' ');

  // Agregar "meta" en el medio
  String palabraConMeta = partes.join(' ${mapMetaPiroOrto[oxigenoValue]} ');

  return palabraConMeta;
}
