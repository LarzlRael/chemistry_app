part of 'utils.dart';

Compound generateSalNeutra(
  PeriodicTableElement periodicTableElement,
  Valencia valence,
  Compound compound,
) {
  List<ValenceCompound> newFormula = List.from(compound.formula);
  newFormula.removeLast();
  newFormula.add(ValenceCompound(
      value: valence.value,
      suffix: ')',
      colorValue: colorByGroup(periodicTableElement.group)));

  return Compound(
    periodicTableElement: periodicTableElement,
    name: setSalNeutralName(compound, periodicTableElement, valence),
    compound: compound,
    type: TypeCompound.sal_neutra,
    formula: [
      ValenceCompound(
        suffix: periodicTableElement.symbol,
        value: compound.formula.last.value.abs(),
        color: colorByGroup(periodicTableElement.group),
        colorValue: hidrogeno,
      ),
      ...newFormula
    ],
  );
}

Compound generateSalBasica(
  Compound hidroxido,
  Compound ion,
) {
  final diff = hidroxido.formula.last.value - ion.formula.last.value.abs();
  final auxHidroxido = hidroxido;
  final auxIon = ion;
  final Map<int, String> termination = {
    1: '',
    2: 'di',
    3: 'tri',
    4: 'tetra',
    5: 'penta',
  };
  auxHidroxido.formula[auxHidroxido.formula.length - 1] =
      hidroxido.formula.last.copyWith(
    value: diff,
    suffix: '(OH)',
  );

  auxIon.formula[auxIon.formula.length - 1] = ion.formula.last.copyWith(
    value: 0,
    suffix: ')',
  );

  return Compound(
    periodicTableElement: getOneELementBySimbol(allListPeriodic, 'Li'),
    name: setSalBasicaName(hidroxido, ion, termination[diff] ?? ''),
    type: TypeCompound.sal_basicas,
    formula: [...auxHidroxido.formula, ...auxIon.formula],
  );
}

Compound generateAcidoHidracido(
  Compound hidroxido,
  Compound ion,
) {
  Compound compoundAux = Compound(
    periodicTableElement: getOneELementBySimbol(allListPeriodic, 'Li'),
    name: setSalBasicaName(hidroxido, ion, ''),
    type: TypeCompound.acido_hidracido,
    formula: [
      ...hidroxido.formula,
      ...ion.formula,
    ],
  );

  return compoundAux;
}

class SalDoble {
  Compound firstSalNeutra;
  Compound secondSalNeutra;
  Compound compoundResult;
  SalDoble({
    required this.firstSalNeutra,
    required this.secondSalNeutra,
    required this.compoundResult,
  });
}

SalDoble generateSalDoble(
  PeriodicTableElement firstPeriodicTableElement,
  PeriodicTableElement secondPeriodicTableElement,
  Valencia firstValenceSelected,
  Valencia secondValenceSelected,
  Compound compound,
) {
  final generateSalNeutraAux = generateSalNeutra(
    firstPeriodicTableElement,
    firstValenceSelected,
    compound,
  );
  final generateSalNeutraAux2 = generateSalNeutra(
    secondPeriodicTableElement,
    secondValenceSelected,
    compound,
  );

  List<ValenceCompound> newFormula = List.from(compound.formula);
  newFormula.removeLast();
  newFormula.add(ValenceCompound(
      value: firstValenceSelected.value + secondValenceSelected.value,
      suffix: ')'));
  /* TODO fix simplify */
  final simplifyFormula = simplify([
    generateSalNeutraAux.formula[0],
    generateSalNeutraAux2.formula[0],
    newFormula.last
  ]);
  final lastNewNformula = newFormula
    ..last.copyWith(value: simplifyFormula[2].value.abs());
  return SalDoble(
      firstSalNeutra: generateSalNeutraAux,
      secondSalNeutra: generateSalNeutraAux2,
      compoundResult: Compound(
        periodicTableElement: firstPeriodicTableElement,
        name: (compound.name.replaceAll(TypeCompound.ion.name, '').trim() +
            " doble " +
            salDobleName(firstPeriodicTableElement, secondPeriodicTableElement,
                firstValenceSelected, secondValenceSelected)),
        type: TypeCompound.sal_doble,
        formula: [
          generateSalNeutraAux.formula[0],
          generateSalNeutraAux2.formula[0],
          ...newFormula
        ],
      ));
}

Compound generateSalHidracida(
  PeriodicTableElement firstMetal,
  PeriodicTableElement secondMetal,
  Valencia firstValencia,
  Valencia secondValencia,
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

  final secondName = osoIcoName(secondMetal, secondValencia);
  Compound compoundAux = Compound(
    periodicTableElement: firstMetal,
    name: elementNameFilter[firstMetal.symbol]! + 'uro ' + secondName,
    type: TypeCompound.sal_hidracida,
    formula: [
      ValenceCompound(
        value: secondValencia.value,
        suffix: firstMetal.symbol,
        /* color: colorByGroup(firstMetal.group),
        colorValue: colorByGroup(secondMetal.group), */
      ),
      ValenceCompound(
        value: firstValencia.value,
        suffix: secondMetal.symbol,
        /* color: colorByGroup(secondMetal.group),
        colorValue: colorByGroup(firstMetal.group), */
      ),
    ],
  );

  return compoundAux;
}

int getNegative(int number) => number < 0 ? number : -number;
