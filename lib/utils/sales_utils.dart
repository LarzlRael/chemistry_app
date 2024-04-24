part of 'utils.dart';

Compound generateSalNeutra(
  PeriodicTableElement periodicTableElement,
  Valencia valence,
  Compound compound,
) {
  List<ValenceCompound> newFormula = List.from(compound.formula);
  newFormula.removeLast();
  newFormula.add(ValenceCompound(value: valence.value, suffix: ')'));

  Compound compoundAux = Compound(
    periodicTableElement: periodicTableElement,
    name: setSalNeutralName(compound, periodicTableElement, valence),
    type: TypeCompound.sal_neutra,
    formula: [
      ValenceCompound(
        suffix: periodicTableElement.symbol,
        value: compound.formula.last.value.abs(),
        colorValue: hidrogeno,
      ),
      ...newFormula
    ],
  );

  return compoundAux;
}

Compound generateSalBasica(
  Compound hidroxido,
  Compound ion,
) {
  Compound compoundAux = Compound(
    periodicTableElement: getOneELement(allListPeriodic, 'Li'),
    name: setSalBasicaName(hidroxido, ion),
    type: TypeCompound.sal_neutra,
    formula: [
      ...hidroxido.formula,
      ...ion.formula,
    ],
  );

  return compoundAux;
}

Compound generateAcidoHidracido(
  Compound hidroxido,
  Compound ion,
) {
  Compound compoundAux = Compound(
    periodicTableElement: getOneELement(allListPeriodic, 'Li'),
    name: setSalBasicaName(hidroxido, ion),
    type: TypeCompound.sal_neutra,
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
  String secondName = '';
  if (secondMetal.valencias.length == 1) {
    secondName = "de ${secondMetal.name.toLowerCase()}";
  } else {
    secondName = "${secondMetal.name.toLowerCase().substring(
          0,
          secondMetal.name.length - 1,
        )}${secondValencia.suffix.name}";
    secondName = fixIcoWord(secondName);
  }
  /* Special names cases */

  if (specialNamesCases.containsKey(secondMetal.symbol)) {
    secondName =
        "${specialNamesCases[secondMetal.symbol]}${secondValencia.suffix.name}";
  }
  Compound compoundAux = Compound(
    periodicTableElement: firstMetal,
    name: elementNameFilter[firstMetal.symbol]! + 'uro ' + secondName,
    type: TypeCompound.sal_hidracida,
    formula: [
      ValenceCompound(value: secondValencia.value, suffix: firstMetal.symbol),
      ValenceCompound(value: firstValencia.value, suffix: secondMetal.symbol),
    ],
  );

  return compoundAux;
}

int getNegative(int number) => number < 0 ? number : -number;
