part of 'utils.dart';

List<Compound> generateOxidosByOneElement(PeriodicTableElement element) {
  final compounds = <Compound>[];

  if (element.valencias.isEmpty) {
    return compounds;
  }

  for (var valencia in element.valencias) {
    if (valencia.typeElement == TypeElement.no_metal) {
      continue;
    }

    final oxideValue = Valence(
      value: 2,
      suffix: "O",
    );

    int elementValue = valencia.value;

    /* get oso or ico */

    final firstValence = Valence(
      suffix: element.symbol,
      value: 2,
    );
    final secondValence = Valence(
      suffix: oxideValue.suffix,
      value: elementValue,
    );
    String name = "";

    if (element.valencias.length == 1) {
      name = "Oxido de ${element.name.toLowerCase()}";
    } else {
      name = "Oxido ${element.name.toLowerCase().substring(
            0,
            element.name.length - 1,
          )}${valencia.suffix.name}";
      name = fixIcoWord(name);
    }
    /* Special names cases */

    if (specialOxidesNameCases.containsKey(element.symbol)) {
      name =
          "Oxido ${specialOxidesNameCases[element.symbol]}${valencia.suffix.name}";
    }
    compounds.add(Compound(
      element: element,
      name: name,
      formula: simplifyValences(firstValence, secondValence),
      type: TypeCompound.oxido,
    ));
  }

  return compounds;
}

List<Compound> generatePeroxidoByOneElement(PeriodicTableElement element) {
  final compound = <Compound>[];

  if (element.valencias.isEmpty) {
    return compound;
  }
  if (element.group == Group.monovalente) {
    final firstValence = Valence(
      suffix: element.symbol,
      value: 1,
    );
    final secondValence = Valence(
      suffix: "O",
      value: 2,
    );
    String name = "Peroxido de ${element.name.toLowerCase()}";

    compound.add(Compound(
      element: element,
      name: name,
      formula: simplifyValences(firstValence, secondValence),
      type: TypeCompound.peroxido,
    ));
  }
  if (element.group == Group.bivalente) {
    String name = "Peroxido de ${element.name.toLowerCase()}";
    final firstValence = Valence(
      suffix: element.symbol,
      value: 2,
    );
    final secondValence = Valence(
      suffix: "O",
      value: 2,
    );
    compound.add(Compound(
      element: element,
      name: name,
      formula: simplifyValences(firstValence, secondValence),
      type: TypeCompound.peroxido,
    ));
  }

  /* final valencia =
      element.valencias.first.value == 1 ? "" : element.valencias.first.value;
  String name = "Peroxido de ${element.name.toLowerCase()}";

  name = "Peroxido de ${element.name.toLowerCase()}";
  compound.add(Compound(
    element: element,
    name: name,
    formula: "${element.symbol}${valencia}O${2}",
    type: TypeCompound.peroxido,
  ));
 */
  return compound;
}

List<Compound> generateOxidosDoblesByOneElement(PeriodicTableElement element) {
  final oxidosDoubles = <Compound>[];
  final getOxide = generateOxidosByOneElement(element);

  final name = "Oxido doble de ${getOxide[0].element.name.toLowerCase()}";

  oxidosDoubles.add(Compound(
    element: element,
    name: name,
    formula: sumValences(
      getOxide[0].formula,
      getOxide.length > 1 ? getOxide[1].formula : getOxide[0].formula,
    ),
    type: TypeCompound.oxido_doble,
  ));
  return oxidosDoubles;
}

List<Compound> generateHidroxidosByOneElement(PeriodicTableElement element) {
  final compounds = <Compound>[];

  if (element.valencias.isEmpty) {
    return compounds;
  }

  for (var valencia in element.valencias) {
    if (valencia.typeElement == TypeElement.no_metal) {
      continue;
    }
    final oxideValue = Valence(
      value: 1,
      suffix: "OH",
    );

    int elementValue = valencia.value;

    /* get oso or ico */
    final suffix = element.valencias.length == 1 ? "" : valencia.suffix.name;
    final firstValence = Valence(
      suffix: element.symbol,
      value: 1,
    );
    final secondValence = Valence(
      suffix: oxideValue.suffix,
      value: elementValue,
    );
    String name = "";

    /* if (elementValue % OXIDE_VALUE == 0) {
      if (elementValue % 2 == 0) {
        oxideValue = elementValue ~/ OXIDE_VALUE;
        elementValue = elementValue ~/ OXIDE_VALUE;
      } else {
        oxideValue = elementValue;
      }
    } */
    if (element.valencias.length == 1) {
      name = "Hidroxido de ${element.name.toLowerCase()}";
    } else {
      name = "Hidroxido ${element.name.toLowerCase().substring(
            0,
            element.name.length - 1,
          )}$suffix";
      name = fixIcoWord(name);
    }
    /* Special names cases */

    if (specialOxidesNameCases.containsKey(element.symbol)) {
      name = "Hidroxido ${specialOxidesNameCases[element.symbol]}$suffix";
    }
    compounds.add(Compound(
      element: element,
      name: name,
      formula: [firstValence, secondValence],
      type: TypeCompound.hidroxido,
    ));
  }

  return compounds;
}

List<Compound> generateHidrurosByOneElement(PeriodicTableElement element) {
  PeriodicTableElement elementAux = element;
  Map<Group, int> groupValenciaMap = {
    Group.monoBivalente: 2,
    Group.bitrivalente: 3,
    Group.bitetravalente: 2
  };

  int? excludedValencia = groupValenciaMap[element.group];

  if (excludedValencia != null) {
    elementAux = element.copyWith(
      valencias: element.valencias
          .where((valencia) => valencia.value != excludedValencia)
          .toList(),
    );
  }
  final compounds = <Compound>[];

  if (elementAux.valencias.isEmpty) {
    return compounds;
  }

  for (var valencia in elementAux.valencias) {
    if (valencia.typeElement == TypeElement.no_metal) {
      continue;
    }
    final oxideValue = Valence(
      value: 1,
      suffix: "H",
    );

    int elementValue = valencia.value;

    /* get oso or ico */
    final suffix = elementAux.valencias.length == 1 ? "" : valencia.suffix.name;
    final firstValence = Valence(
      suffix: elementAux.symbol,
      value: 1,
    );
    final secondValence = Valence(
      suffix: oxideValue.suffix,
      value: elementValue,
    );
    String name = "";

    if (elementAux.valencias.length == 1) {
      name = "Hidruro de ${elementAux.name.toLowerCase()}";
    } else {
      name = "Hidruro ${elementAux.name.toLowerCase().substring(
            0,
            elementAux.name.length - 1,
          )}$suffix";
      name = fixIcoWord(name);
    }

    if (specialHidrurosNameCases.containsKey(elementAux.symbol)) {
      name = "Hidruro ${specialHidrurosNameCases[elementAux.symbol]}$suffix";
    }
    compounds.add(Compound(
      element: elementAux,
      name: name,
      formula: [firstValence, secondValence],
      type: TypeCompound.hidruro,
    ));
  }

  return compounds;
}
