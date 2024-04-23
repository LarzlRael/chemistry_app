part of '../../pages.dart';

class SalesNeutras extends HookWidget {
  const SalesNeutras({super.key});
  static const routeName = 'sales_neutras';
  @override
  Widget build(BuildContext context) {
    final ionSelected = useState<Compound?>(null);
    final result = useState<Compound?>(null);
    final metalSelected = useState<PeriodicTableElement?>(null);
    final currentValencia = useState<Valencia?>(null);
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    useEffect(() {
      if (metalSelected.value != null && ionSelected.value != null) {
        result.value = generateSalNeutra(
          metalSelected.value!,
          currentValencia.value!,
          ionSelected.value!,
        );
      }
    }, [metalSelected.value, ionSelected.value]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales neutras'),
      ),
      body: ScaffoldBackground(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SelecteCardForSal(
                    color: metalSelected.value == null
                        ? null
                        : colorByGroup(metalSelected.value!.group),
                    title: 'Metal',
                    onTap: () => bottomSheetMetals(context, metalSelected,
                        currentValencia, generateMetals(metalGroup)),
                    width: mediaQuery.width * 0.4,
                    child: metalSelected.value == null
                        ? Text(
                            'Seleccione un metal',
                            textAlign: TextAlign.center,
                            style: textTheme.labelMedium,
                          )
                        : MetalSelectedCard(
                            metalSelected: metalSelected,
                            currentValencia: currentValencia,
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(FontAwesomeIcons.circlePlus),
                  ),
                  SelecteCardForSal(
                    color: ionSelected.value == null
                        ? null
                        : colorByCompoundType(ionSelected.value!.type),
                    title: 'Ion',
                    width: mediaQuery.width * 0.4,
                    onTap: () => bottomSheetIones(context, ionSelected),
                    child: ionSelected.value == null
                        ? Text(
                            'Seleccione un ion',
                            style: textTheme.labelMedium,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ionSelected.value!.name,
                                style: textTheme.titleLarge!.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              FormulaInText(
                                compoundFormula: ionSelected.value!.formula,
                                typeCompound: ionSelected.value!.type,
                                fontSize: 30,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
              result.value == null
                  ? SimpleText(
                      'Seleccione ambos elementos para ver el formar una sal neutra.',
                      padding: EdgeInsets.symmetric(vertical: 20),
                      textAlign: TextAlign.center,
                    )
                  : Card(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        /* margin: EdgeInsets.symmetric(vertical: 20), */
                        width: mediaQuery.width * 0.90,
                        height: mediaQuery.height * 0.25,
                        /* padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10.0), */
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colorByCompoundType(result.value!.type),
                              colorByCompoundType(result.value!.type)
                                  .withOpacity(0.5),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FormulaInText(
                              compoundFormula: result.value!.formula,
                              typeCompound: result.value!.type,
                              fontSize: 55,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SimpleText(
                              result.value!.name.toCapitalize(),
                              style: textTheme.headlineMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
