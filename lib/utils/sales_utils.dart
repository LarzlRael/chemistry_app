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
