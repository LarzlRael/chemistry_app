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
          ValenceCompound(
            suffix: firstPeriodicTableElement.symbol,
            value: firstValenceSelected.value,
            colorValue: hidrogeno,
          ),
          ValenceCompound(
            suffix: secondPeriodicTableElement.symbol,
            value: secondValenceSelected.value,
            colorValue: hidrogeno,
          ),
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
  Compound compoundAux = Compound(
    periodicTableElement: getOneELement(allListPeriodic, 'Li'),
    /* TODO fix thos */
    name: elementNameFilter[firstMetal.symbol]! + 'uro ' + secondMetal.name,
    type: TypeCompound.sal_neutra,
    formula: [
      ValenceCompound(value: secondValencia.value, suffix: firstMetal.symbol),
      ValenceCompound(value: firstValencia.value, suffix: secondMetal.symbol),
    ],
  );

  return compoundAux;
}

int getNegative(int number) => number < 0 ? number : -number;
