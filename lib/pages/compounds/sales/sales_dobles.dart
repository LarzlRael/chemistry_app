part of '../../pages.dart';

class SalesDobles extends HookWidget {
  const SalesDobles({super.key});
  static const routeName = 'sales_dobles';
  @override
  Widget build(BuildContext context) {
    final firstMetalSelected = useState<PeriodicTableElement?>(null);
    final secondMetalSelected = useState<PeriodicTableElement?>(null);
    final ionSelected = useState<Compound?>(null);
    final result = useState<SalDoble?>(null);
    final currenFirstValencia = useState<Valencia?>(null);
    final currentSecondValencia = useState<Valencia?>(null);
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    useEffect(() {
      if (firstMetalSelected.value != null &&
          secondMetalSelected.value != null &&
          ionSelected.value != null) {
        result.value = generateSalDoble(
          firstMetalSelected.value!,
          secondMetalSelected.value!,
          currenFirstValencia.value!,
          currentSecondValencia.value!,
          ionSelected.value!,
        );
      }
    }, [
      firstMetalSelected.value,
      secondMetalSelected.value,
      ionSelected.value
    ]);
    return ScaffoldBackground(
      appBar: AppBar(
        title: Text('Sales dobles'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SelecteCardForSal(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: firstMetalSelected.value == null
                              ? null
                              : colorByGroup(firstMetalSelected.value!.group),
                          title: 'Primer Metal',
                          onTap: () => bottomSheetMetals(
                              context,
                              firstMetalSelected,
                              currenFirstValencia,
                              generateMetals(metalGroup)),
                          width: mediaQuery.width * 0.4,
                          height: mediaQuery.height * 0.15,
                          child: firstMetalSelected.value == null
                              ? SimpleText(
                                  padding: EdgeInsets.symmetric(horizontal: 2),
                                  'Seleccione primer metal',
                                  textAlign: TextAlign.center,
                                  style: textTheme.labelMedium,
                                )
                              : MetalSelectedCard(
                                  sizeReduce: 0.8,
                                  metalSelected: firstMetalSelected,
                                  currentValencia: currenFirstValencia,
                                ),
                        ),
                        SelecteCardForSal(
                          color: secondMetalSelected.value == null
                              ? null
                              : colorByGroup(secondMetalSelected.value!.group),
                          title: 'Segundo Metal',
                          height: mediaQuery.height * 0.15,
                          onTap: () => bottomSheetMetals(
                            context,
                            secondMetalSelected,
                            currentSecondValencia,
                            generateMetals(
                              metalGroup,
                            ),
                          ),
                          width: mediaQuery.width * 0.4,
                          child: secondMetalSelected.value == null
                              ? Text(
                                  'Seleccione segundo metal',
                                  textAlign: TextAlign.center,
                                  style: textTheme.labelMedium,
                                )
                              : MetalSelectedCard(
                                  sizeReduce: 0.8,
                                  metalSelected: secondMetalSelected,
                                  currentValencia: currentSecondValencia,
                                ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(FontAwesomeIcons.circlePlus),
                    ),
                    SelectableCardSal(
                      compound: ionSelected.value,
                      onTap: () => bottomSheetIones(
                        context,
                        ionSelected,
                        "Buscar ion",
                      ),
                    ),
                  ],
                ),
                result.value == null
                    ? SimpleText(
                        'Seleccione 2 metales y un Ion para formar una sal doble.',
                        padding: EdgeInsets.symmetric(vertical: 20),
                        textAlign: TextAlign.center,
                      )
                    : Column(
                        children: [
                          Plus2Elements(
                            iconSize: 30,
                            element1: CardSales(
                              width: 0.7,
                              compound: result.value!.firstSalNeutra,
                              height: 0.18,
                            ),
                            element2: CardSales(
                              width: 0.7,
                              compound: result.value!.secondSalNeutra,
                              height: 0.18,
                            ),
                          ),
                          CardSales(
                            fontSize: 40,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            compound: result.value!.compoundResult,
                            height: 0.20,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
