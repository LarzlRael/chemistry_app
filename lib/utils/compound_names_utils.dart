part of 'utils.dart';

String osoIcoName(
  PeriodicTableElement elementName,
  Valencia valencia,
  /* String group, */
) {
  String name = "";

  if (elementName.valencias.length == 1) {
    name = "de ${elementName.name.toLowerCase()}";
  } else {
    name = " ${elementName.name.toLowerCase().substring(
          0,
          elementName.name.length - 1,
        )}${valencia.suffix.name}";
    name = fixIcoWord(name);
  }
  /* Special names cases */

  if (specialNamesCases.containsKey(elementName.symbol)) {
    name = " ${specialNamesCases[elementName.symbol]}${valencia.suffix.name}";
  }

  return name;
}
