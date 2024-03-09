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

    final oxideValue = ValenceCompound(
      value: 2,
      suffix: "O",
    );

    int elementValue = valencia.value;

    /* get oso or ico */

    final firstValence = ValenceCompound(
      suffix: element.symbol,
      value: 2,
    );
    final secondValence = ValenceCompound(
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

    if (specialNamesCases.containsKey(element.symbol)) {
      name =
          "Oxido ${specialNamesCases[element.symbol]}${valencia.suffix.name}";
    }
    if (element.symbol == "Bi" && valencia.value == 3) {
      name = "Oxido de bismuto";
    }
    compounds.add(Compound(
      element: element,
      name: name,
      isSpecialCase: specialNamesCases.containsKey(element.symbol),
      formula: simplify([firstValence, secondValence]),
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
    final firstValence = ValenceCompound(
      suffix: element.symbol,
      value: 2,
    );
    final secondValence = ValenceCompound(
      suffix: "O",
      value: 2,
    );
    String name = "Peroxido de ${element.name.toLowerCase()}";

    compound.add(Compound(
      element: element,
      name: name,
      formula: [firstValence, secondValence],
      type: TypeCompound.peroxido,
    ));
  }
  if (element.group == Group.bivalente) {
    String name = "Peroxido de ${element.name.toLowerCase()}";
    final firstValence = ValenceCompound(
      suffix: element.symbol,
      value: 1,
    );
    final secondValence = ValenceCompound(
      suffix: "O",
      value: 2,
    );
    compound.add(Compound(
      element: element,
      name: name,
      formula: [firstValence, secondValence],
      type: TypeCompound.peroxido,
    ));
  }

  return compound;
}

List<Compound> generateOxidosDoblesByOneElement(PeriodicTableElement element) {
  final oxidosDoubles = <Compound>[];

  final getOxide = generateOxidosByOneElement(element);

  final name = "Oxido doble de ${getOxide[0].element.name.toLowerCase()}";
  final isBismuto = element.symbol == "Bi";
  oxidosDoubles.add(Compound(
    element: element,
    name: name,
    isSpecialCase: isBismuto,
    formula: [
      ValenceCompound(
        value: isBismuto ? 2 : 3,
        suffix: getOxide[0].element.symbol,
      ),
      ValenceCompound(
        value: 4,
        suffix: 'O',
      ),
    ],
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
    final oxideValue = ValenceCompound(
      value: 1,
      suffix: "OH",
    );

    int elementValue = valencia.value;

    /* get oso or ico */
    final suffix = element.valencias.length == 1 ? "" : valencia.suffix.name;
    final firstValence = ValenceCompound(
      suffix: element.symbol,
      value: 1,
    );
    final secondValence = ValenceCompound(
      suffix: oxideValue.suffix,
      value: elementValue,
    );
    String name = "";

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

    if (specialNamesCases.containsKey(element.symbol)) {
      name = "Hidroxido ${specialNamesCases[element.symbol]}$suffix";
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
  final spcialHidrurosCase = ["Cu", "Pb", "Fe"];
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
    final oxideValue = ValenceCompound(
      value: 1,
      suffix: "H",
    );

    int elementValue = valencia.value;

    /* get oso or ico */
    final suffix = elementAux.valencias.length == 1 ? "" : valencia.suffix.name;
    final firstValence = ValenceCompound(
      suffix: elementAux.symbol,
      value: 1,
    );
    final secondValence = ValenceCompound(
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

    if (specialNamesCases.containsKey(elementAux.symbol)) {
      name = "Hidruro ${specialNamesCases[elementAux.symbol]}$suffix";
    }
    if (spcialHidrurosCase.contains(elementAux.symbol)) {
      name = "Hidruro de ${elementAux.name.toLowerCase()}";
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

List<Compound> generateAnhidridosByOneElement(PeriodicTableElement element) {
  final compounds = <Compound>[];

  if (element.valencias.isEmpty) {
    return compounds;
  }

  for (var valencia in element.valencias) {
    if (valencia.typeElement == TypeElement.metal) {
      continue;
    }
    final oxideValue = ValenceCompound(
      value: 2,
      suffix: "O",
    );

    int elementValue = valencia.value;

    final firstValence = ValenceCompound(
      suffix: element.symbol,
      value: oxideValue.value,
    );
    final secondValence = ValenceCompound(
      suffix: oxideValue.suffix,
      value: elementValue,
    );
    String name = "";

    if (element.valencias.length == 1) {
      name = "$anhidridoName de ${element.name.toLowerCase()}";
    }
    if (element.valencias.length > 1 && valencia.suffix == TypeValencia.ico ||
        valencia.suffix == TypeValencia.oso) {
      name = setAnhidridoName(element, valencia);
    }
    if (element.valencias.length > 2 &&
            valencia.suffix == TypeValencia.hipo_oso ||
        valencia.suffix == TypeValencia.per_ico) {
      name = setAnhidridoHipoOsoName(element, valencia);
    }

    compounds.add(
      Compound(
        element: element,
        isSpecialCase: valencia.value == 6,
        name: name,
        formula: simplify([firstValence, secondValence]),
        type: TypeCompound.anhidrido,
      ),
    );
  }

  return compounds;
}

List<Compound> generateAcidosOxacidosByOneElement(
    PeriodicTableElement element) {
  final exceptions = ["P", "Sb", "As", "B", "Si"];
  if (exceptions.contains(element.symbol)) {
    return [];
  }
  final getAnhidrido = generateAnhidridosByOneElement(element);
  const nameType = "Acido";
  final compounds = <Compound>[];

  for (var anhidrido in getAnhidrido) {
    String name = "$nameType";

    /*  if (noMetalspecialameCases.containsKey(element.symbol)) {
      name = "$nameType ${noMetalspecialameCases[element.symbol]}$suffix";
    } */
    if (anhidrido.name.contains("hiponitroso")) {
      compounds.add(
        Compound(
          compound: anhidrido,
          element: element,
          name: anhidrido.name.replaceFirst(anhidridoName, name),
          isSpecialCase: true,
          formula: [
            ValenceCompound(
              suffix: "H",
              value: 2,
            ),
            ValenceCompound(
              suffix: "N",
              value: 2,
            ),
            ValenceCompound(
              suffix: "O",
              value: 2,
            ),
          ],
          type: TypeCompound.acido_oxacido,
        ),
      );
    } else {
      compounds.add(
        Compound(
          compound: anhidrido,
          element: element,
          name: anhidrido.name.replaceFirst(anhidridoName, name),
          formula: simplify([
            ValenceCompound(
              suffix: "H",
              value: 2,
            ),
            /* Si la valencia es impar poner 1 */
            /* Si la valencia es par poner 2 */
            /* EL oxigeno es con lo que aumente
        valencia * lo aumentado*/
            ...anhidrido.formula.map(
                (e) => e.suffix == "O" ? e.copyWith(value: e.value + 1) : e),
          ]),
          type: TypeCompound.acido_oxacido,
        ),
      );
    }
  }

  return compounds;
}

List<Compound> generateAcidosPolihidratadosByOneElement() {
  final exceptions = ["P", "Sb", "As", "B", "Si"];

  final getElements = getElementsBySimbols(allListPeriodic, exceptions);
  final filteredElements = getElements.map((e) {
    switch (e.symbol) {
      case "P":
      case "Sb":
      case "As":
        return filterValencias(e, [3, 5]);

      case "B":
        return filterValencias(e, [3]);

      case "Si":
        return filterValencias(e, [4]);

      default:
        [];
    }
  }).toList();

  final compounds = <Compound>[];

  filteredElements.forEach((element) {
    final getAnhidrido = generateAnhidridosByOneElement(element!);
    getAnhidrido.forEachIndexed((index, anhidrido) {
      [1, 2, 3].forEach((i) {
        // Generar cada compuesto original tres veces
        final modifiedAcido = anhidrido.copyWith(
            formula: simplify([
              ValenceCompound(
                suffix: "H",
                value: 2 * i,
              ),
              ...anhidrido.formula.map((e) {
                if (e.suffix == "O") {
                  return e.copyWith(
                    value: i + anhidrido.formula.last.value,
                  );
                }
                return e;
              }),
            ]),
            name: acidoPolihidracidoName(
              changeAcidoName(anhidrido.name, element.symbol),
              i,
            ));
        compounds.add(modifiedAcido);
      });
    });
  });

  return compounds;
}

List<Compound> generateIonesByOneElement(PeriodicTableElement element) {
  final getAcido = generateAcidosOxacidosByOneElement(element)
      .map((e) => e.copyWith(name: remplazeOsoIco(e.name)))
      .toList();

  final convertIon = getAcido.map((acido) {
    final ion = acido.copyWith(
      name: acido.name.replaceFirst("Acido", "Ion"),
      type: TypeCompound.ion,
      formula: moveFirstElementToLastPosition(acido.formula.map((e) {
        if (e.suffix == "H") {
          return e.copyWith(value: makeNegative(e.value), suffix: '');
        }
        return e;
      }).toList()),
    );
    return ion;
  }).toList();
  return convertIon;
}

Compound generateOneIon(
  PeriodicTableElement periodicTableElement,
  Valencia valence,
  Compound compound,
) {
  List<ValenceCompound> newFormula = List.from(compound.formula);
  newFormula.removeLast();
  newFormula.add(ValenceCompound(value: valence.value, suffix: ''));

  return Compound(
    element: periodicTableElement,
    name: (compound.name.replaceAll('Ion', '') +
        salNeutraName(periodicTableElement, valence)),
    type: TypeCompound.sal_neutra,
    formula: [
      ValenceCompound(
        suffix: periodicTableElement.symbol,
        value: compound.formula.last.value.abs(),
      ),
      ...newFormula,
    ],
  );
}
