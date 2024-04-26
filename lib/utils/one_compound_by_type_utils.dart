part of 'utils.dart';

List<Compound> generateOxidosByOneElement(PeriodicTableElement element) {
  final compounds = <Compound>[];

  if (element.valencias.isEmpty) {
    return compounds;
  }

  final oxidoName = TypeCompound.oxido.name;
  for (var valencia in element.valencias) {
    final isNh4 = element.symbol.contains('NH4');
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
      colorValue: oxigeno,
    );
    final secondValence = ValenceCompound(
      suffix: oxideValue.suffix,
      value: elementValue,
      color: oxigeno,
    );
    final formula = isNh4
        ? [
            ValenceCompound(
              suffix: '(NH',
              value: 4,
              /* colorValue: oxigeno, */
            ),
            ValenceCompound(
              suffix: ")",
              value: 2,
              colorValue: oxigeno,
            ),
            secondValence,
          ]
        : simplify([firstValence, secondValence]);
    String name = "";

    if (element.valencias.length == 1) {
      name = "$oxidoName de ${element.name.toLowerCase()}";
    } else {
      name = "$oxidoName ${element.name.toLowerCase().substring(
            0,
            element.name.length - 1,
          )}${valencia.suffix.name}";
      name = fixIcoWord(name);
    }
    /* Special names cases */

    if (specialNamesCases.containsKey(element.symbol)) {
      name =
          "$oxidoName ${specialNamesCases[element.symbol]}${valencia.suffix.name}";
    }
    if (element.symbol == "Bi" && valencia.value == 3) {
      name = "$oxidoName de bismuto";
    }
    compounds.add(
      Compound(
        periodicTableElement: element,
        name: name,
        isSpecialCase: specialNamesCases.containsKey(element.symbol),
        formula: formula,
        type: TypeCompound.oxido,
        compoundString: formula.map((e) => e.concatValenceCompound()).join(''),
      ),
    );
  }

  return compounds;
}

List<Compound> generatePeroxidoByOneElement(PeriodicTableElement element) {
  final compound = <Compound>[];

  final peroxidoName = TypeCompound.peroxido.name;
  if (element.valencias.isEmpty) {
    return compound;
  }
  if (element.group == Group.monovalente) {
    final valences = [
      ValenceCompound(
        suffix: element.symbol.contains('NH4')
            ? '(${element.symbol})'
            : element.symbol,
        value: 2,
        colorValue: oxigeno,
      ),
      ValenceCompound(
        suffix: "O",
        value: 2,
        color: oxigeno,
      )
    ];

    String name = "$peroxidoName de ${element.name.toLowerCase()}";

    compound.add(Compound(
      periodicTableElement: element,
      name: name,
      compoundString: valences.map((e) => e.concatValenceCompound()).join(''),
      formula: valences,
      type: TypeCompound.peroxido,
    ));
  }
  if (element.group == Group.bivalente) {
    String name = "$peroxidoName de ${element.name.toLowerCase()}";
    final valences = [
      ValenceCompound(
        suffix: element.symbol,
        value: 1,
        colorValue: oxigeno,
      ),
      ValenceCompound(
        suffix: "O",
        value: 2,
        color: oxigeno,
      )
    ];

    compound.add(Compound(
      periodicTableElement: element,
      name: name,
      formula: valences,
      type: TypeCompound.peroxido,
      compoundString: valences.map((e) => e.concatValenceCompound()).join(''),
    ));
  }

  return compound;
}

List<Compound> generateOxidosDoblesByOneElement(PeriodicTableElement element) {
  final oxidosDoubles = <Compound>[];

  final getOxide = generateOxidosByOneElement(element);

  final isBismuto = element.symbol == "Bi";
  final name =
      "${TypeCompound.oxido_doble.name} de ${getOxide[0].periodicTableElement.name.toLowerCase()}";
  final valences = [
    ValenceCompound(
      value: isBismuto ? 2 : 3,
      suffix: getOxide[0].periodicTableElement.symbol,
      colorValue: oxigeno,
    ),
    ValenceCompound(
      value: 4,
      suffix: 'O',
      color: oxigeno,
    ),
  ];
  oxidosDoubles.add(Compound(
    periodicTableElement: element,
    name: name,
    isSpecialCase: isBismuto,
    formula: valences,
    type: TypeCompound.oxido_doble,
    compoundString: valences.map((e) => e.concatValenceCompound()).join(''),
  ));
  return oxidosDoubles;
}

List<Compound> generateHidroxidosByOneElement(PeriodicTableElement element) {
  final compounds = <Compound>[];

  if (element.valencias.isEmpty) {
    return compounds;
  }

  for (var valencia in element.valencias) {
    final isNh4 = element.symbol.contains('NH4');
    if (valencia.typeElement == TypeElement.no_metal) {
      continue;
    }
    final oxideValue = ValenceCompound(value: 1, suffix: "(OH)", color: agua);

    int elementValue = valencia.value;

    /* get oso or ico */
    final suffix = element.valencias.length == 1 ? "" : valencia.suffix.name;
    final formula = isNh4
        ? [
            ValenceCompound(
              suffix: 'NH',
              value: 4,
              /* colorValue: oxigeno, */
            ),
            ValenceCompound(
              suffix: "",
              value: 1,
              /* color: oxigeno, */
            ),
            ValenceCompound(
              suffix: "(OH)",
              value: elementValue,
              color: agua,
            ),
          ]
        : [
            ValenceCompound(
              suffix: element.symbol,
              value: 1,
            ),
            ValenceCompound(
              suffix: oxideValue.suffix,
              value: elementValue,
              color: agua,
            ),
          ];

    String name = "";
    final hidroxidoName = TypeCompound.hidroxido.name;
    if (element.valencias.length == 1) {
      name = "$hidroxidoName de ${element.name.toLowerCase()}";
    } else {
      name = "$hidroxidoName ${element.name.toLowerCase().substring(
            0,
            element.name.length - 1,
          )}$suffix";
      name = fixIcoWord(name);
    }
    /* Special names cases */

    if (specialNamesCases.containsKey(element.symbol)) {
      name = "$hidroxidoName ${specialNamesCases[element.symbol]}$suffix";
    }
    compounds.add(
      Compound(
        compound: null,
        periodicTableElement: element,
        name: name,
        formula: formula,
        type: TypeCompound.hidroxido,
        compoundString: formula.map((e) => e.concatValenceCompound()).join(''),
      ),
    );
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
  final hidruroName = TypeCompound.hidruro.name;

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
    final valences = [
      ValenceCompound(
        suffix: elementAux.symbol,
        value: 1,
      ),
      ValenceCompound(
        suffix: oxideValue.suffix,
        value: elementValue,
        color: hidrogeno,
      ),
    ];

    String name = "";

    if (elementAux.valencias.length == 1) {
      name = "$hidruroName de ${elementAux.name.toLowerCase()}";
    } else {
      name = "$hidruroName ${elementAux.name.toLowerCase().substring(
            0,
            elementAux.name.length - 1,
          )}$suffix";
      name = fixIcoWord(name);
    }

    if (specialNamesCases.containsKey(elementAux.symbol)) {
      name = "$hidruroName ${specialNamesCases[elementAux.symbol]}$suffix";
    }
    if (spcialHidrurosCase.contains(elementAux.symbol)) {
      name = "$hidruroName de ${elementAux.name.toLowerCase()}";
    }
    compounds.add(Compound(
      periodicTableElement: elementAux,
      name: name,
      formula: valences,
      type: TypeCompound.hidruro,
      compoundString: valences.map((e) => e.concatValenceCompound()).join(''),
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
      colorValue: oxigeno,
    );
    final secondValence = ValenceCompound(
      suffix: oxideValue.suffix,
      value: element.symbol == 'F' ? 1 : elementValue,
      color: oxigeno,
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
        periodicTableElement: element,
        isSpecialCase: valencia.value == 6,
        name: name,
        formula: simplify([firstValence, secondValence]),
        type: TypeCompound.anhidrido,
        compoundString: simplify([firstValence, secondValence])
            .map((e) => e.concatValenceCompound())
            .join(''),
      ),
    );
  }

  return compounds;
}

final exceptions = ["P", "Sb", "As", "B", "Si"];
List<Compound> generateAcidosOxacidosByOneElement(
    PeriodicTableElement element) {
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
      final formula = [
        ValenceCompound(
          suffix: "H",
          value: 2,
          color: hidrogeno,
        ),
        ValenceCompound(
          suffix: "N",
          value: 2,
        ),
        ValenceCompound(
          suffix: "O",
          value: 2,
          color: oxigeno,
        ),
      ];
      compounds.add(
        Compound(
          compound: anhidrido,
          periodicTableElement: element,
          name: anhidrido.name.replaceFirst(anhidridoName, name),
          isSpecialCase: true,
          formula: formula,
          type: TypeCompound.acido_oxacido,
          compoundString:
              formula.map((e) => e.concatValenceCompound()).join(''),
        ),
      );
    } else {
      final formula = simplify([
        ValenceCompound(
          suffix: "H",
          value: 1,
          color: hidrogeno,
        ),
        ...anhidrido.formula.map(
          (e) => e.suffix == "O"
              ? e.copyWith(
                  value: e.value + 1,
                )
              : e,
        ),
      ]);
      compounds.add(
        Compound(
          compound: anhidrido,
          periodicTableElement: element,
          name: anhidrido.name.replaceFirst(anhidridoName, name),
          formula: formula,
          type: TypeCompound.acido_oxacido,
          compoundString:
              formula.map((e) => e.concatValenceCompound()).join(''),
        ),
      );
    }
  }

  return compounds;
}

List<Compound> generateAcidosHidracidosByOneElement(
  PeriodicTableElement element,
) {
  final elementNameFilter = {
    'F': 'fluor',
    'Cl': 'clor',
    'Br': 'brom',
    'I': 'yod',
    'S': 'sulf',
    'Se': 'selen',
    'Te': 'telur',
  };
  final groupValue = noMetalesNegativeValue[element.group];
  final formula = [
    ValenceCompound(
      suffix: "H",
      value: groupValue!.abs(),
      color: hidrogeno,
    ),
    ValenceCompound(
      suffix: element.symbol,
      value: 1,
    ),
  ];
  return [
    Compound(
      periodicTableElement: element,
      name: "Acido " + elementNameFilter[element.symbol]! + "hídrico",
      formula: formula,
      type: TypeCompound.acido_hidracido,
      compoundString: formula.map((e) => e.concatValenceCompound()).join(''),
    ),
  ];
}

List<Compound> generateAcidosPolihidratadosByOneElement() {
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
      final formula = simplify([
        ValenceCompound(
          suffix: "H",
          value: 2,
          color: hidrogeno,
        ),
        ...anhidrido.formula.map((e) => (e.suffix == "O")
            ? e.copyWith(
                value: 2 + anhidrido.formula.last.value,
              )
            : e),
      ]);
      [1, 2, 3].forEach((i) {
        // Generar cada compuesto original tres veces
        final modifiedAcido = anhidrido.copyWith(
          compound: anhidrido,
          formula: formula,
          formulaString: formula.map((e) => e.concatValenceCompound()).join(''),
          type: TypeCompound.acido_polihidratado,
        );
        compounds.add(modifiedAcido);
      });
    });
  });

  return compounds;
}

List<Compound> generateIonesByOneElement(PeriodicTableElement element) {
  /* change this */
  final getAcidos = generateAcidosOxacidosByOneElement(element)
      .map((e) => e.copyWith(name: remplazeOsoIco(e.name)))
      .toList();
  final getAcidosAux = generateAcidosOxacidosByOneElement(element);

  final convertIon = getAcidos.mapIndexed((index, acido) {
    final formula = moveFirstElementToLastPosition(acido.formula.map(
      (e) {
        if (e.suffix == "H") {
          return e.copyWith(
            value: makeNegative(e.value),
            suffix: ')',
            color: Colors.white,
            isSuperIndex: true,
          );
        }
        return e;
      },
    ).toList());

    final ion = acido.copyWith(
      compound: getAcidosAux[index],
      name: acido.name.replaceFirst("Acido", TypeCompound.ion.name),
      type: TypeCompound.ion,
      formula: formula,
      formulaString: formula.map((e) => e.concatValenceCompound()).join(''),
    );
    return ion;
  }).toList();
  return convertIon;
}

List<Compound> generateSalesHidracidas(PeriodicTableElement element) {
  /* change this */
  final getAcidos = generateAcidosOxacidosByOneElement(element)
      .map((e) => e.copyWith(name: remplazeOsoIco(e.name)))
      .toList();
  final getAcidosAux = generateAcidosOxacidosByOneElement(element);

  final convertIon = getAcidos.mapIndexed((index, acido) {
    final ion = acido.copyWith(
      compound: getAcidosAux[index],
      name: acido.name.replaceFirst("Acido", TypeCompound.ion.name),
      type: TypeCompound.ion,
      formula: moveFirstElementToLastPosition(acido.formula.map(
        (e) {
          if (e.suffix == "H") {
            return e.copyWith(
              value: makeNegative(e.value),
              suffix: ')',
              color: Colors.white,
              isSuperIndex: true,
            );
          }
          return e;
        },
      ).toList()),
    );
    return ion;
  }).toList();
  return convertIon;
}

List<Compound> hidrurosNoMetalicos() {
  return [
    Compound(
      periodicTableElement: getOneELementBySimbol(allListPeriodic, 'Li'),
      name: "Amoniaco",
      formula: [
        ValenceCompound(
          suffix: "N",
          value: 0,
          /* color: hidrogeno, */
        ),
        ValenceCompound(
          suffix: "h",
          value: 3,
          color: hidrogeno,
        ),
      ],
      type: TypeCompound.hidruro,
    ),
    Compound(
      periodicTableElement: getOneELementBySimbol(allListPeriodic, 'Li'),
      name: "Fosfano",
      formula: [
        ValenceCompound(
          suffix: "P",
          value: 0,
        ),
        ValenceCompound(
          suffix: "h",
          value: 3,
          color: hidrogeno,
        ),
      ],
      type: TypeCompound.hidruro,
    ),
    Compound(
      periodicTableElement: getOneELementBySimbol(allListPeriodic, 'Li'),
      name: "Estibano",
      formula: [
        ValenceCompound(
          suffix: "Sb",
          value: 0,
        ),
        ValenceCompound(
          suffix: "h",
          value: 3,
          color: hidrogeno,
        ),
      ],
      type: TypeCompound.hidruro,
    ),
    Compound(
      periodicTableElement: getOneELementBySimbol(allListPeriodic, 'Li'),
      name: "Arsano",
      formula: [
        ValenceCompound(
          suffix: "As",
          value: 0,
        ),
        ValenceCompound(
          suffix: "h",
          value: 3,
          color: hidrogeno,
        ),
      ],
      type: TypeCompound.hidruro,
    ),
    Compound(
      periodicTableElement: getOneELementBySimbol(allListPeriodic, 'Li'),
      name: "Borano",
      formula: [
        ValenceCompound(
          suffix: "B",
          value: 0,
        ),
        ValenceCompound(
          suffix: "h",
          value: 3,
          color: hidrogeno,
        ),
      ],
      type: TypeCompound.hidruro,
    ),
    Compound(
      periodicTableElement: getOneELementBySimbol(allListPeriodic, 'Li'),
      name: "Carbono",
      formula: [
        ValenceCompound(
          suffix: "C",
          value: 0,
        ),
        ValenceCompound(
          suffix: "h",
          value: 4,
          color: hidrogeno,
        ),
      ],
      type: TypeCompound.hidruro,
    ),
    Compound(
      periodicTableElement: getOneELementBySimbol(allListPeriodic, 'Li'),
      name: "Silano",
      formula: [
        ValenceCompound(
          suffix: "Si",
          value: 0,
        ),
        ValenceCompound(
          suffix: "h",
          value: 4,
          color: hidrogeno,
        ),
      ],
      type: TypeCompound.hidruro,
    ),
  ];
}
