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
                            sizeReduce: 0.85,
                            metalSelected: metalSelected,
                            currentValencia: currentValencia,
                          ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(FontAwesomeIcons.circlePlus),
                  ),
                  SelectableCardSal(
                    compound: ionSelected.value,
                    onTap: () =>
                        bottomSheetIones(context, ionSelected, "Buscar ion"),
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
