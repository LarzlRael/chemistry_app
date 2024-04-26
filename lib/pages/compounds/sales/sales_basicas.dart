part of '../../pages.dart';

class SalesBasicas extends HookWidget {
  const SalesBasicas({super.key});
  static const routeName = 'sales_basicas';
  @override
  Widget build(BuildContext context) {
    final hidroxidoSelected = useState<Compound?>(null);

    final ionSelected = useState<Compound?>(null);
    final result = useState<Compound?>(null);

    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    final styleMetalCard = textTheme.titleLarge!.copyWith(
      color: Colors.white,
    );

    useEffect(() {
      if (hidroxidoSelected.value != null && ionSelected.value != null) {
        result.value = generateSalBasica(
          hidroxidoSelected.value!,
          ionSelected.value!,
        );
      }
    }, [hidroxidoSelected.value, ionSelected.value]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales basicas'),
      ),
      body: ScaffoldBackground(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SelecteCardForSal(
                          color: hidroxidoSelected.value == null
                              ? null
                              : colorByCompoundType(
                                  hidroxidoSelected.value!.type),
                          title: 'Hidroxido',
                          /* height: mediaQuery.height * 0.15, */
                          onTap: () => bottomSheetByCompounds(
                            context,
                            hidroxidoSelected,
                            generateHidroxidosByGroupsElements(hidroxidoGroup),
                            'Buscar hidroxido',
                          ),
                          width: mediaQuery.width * 0.4,
                          child: hidroxidoSelected.value == null
                              ? Text(
                                  'Seleccione hidroxido',
                                  textAlign: TextAlign.center,
                                  style: textTheme.labelMedium,
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FormulaInText(
                                      compoundFormula:
                                          hidroxidoSelected.value!.formula,
                                      typeCompound:
                                          hidroxidoSelected.value!.type,
                                      fontSize: 30,
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SimpleText(
                                      hidroxidoSelected.value!.name,
                                      style: styleMetalCard,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                        ),
                      ],
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
                      onTap: () =>
                          bottomSheetIones(context, ionSelected, "Buscar ion"),
                      child: ionSelected.value == null
                          ? Text(
                              'Seleccione ion',
                              style: textTheme.labelMedium,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FormulaInText(
                                  compoundFormula: ionSelected.value!.formula,
                                  typeCompound: ionSelected.value!.type,
                                  fontSize: 30,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  ionSelected.value!.name,
                                  style: textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
                result.value == null
                    ? SimpleText(
                        'Seleccione un hidroxido y un ion para obtener el resultado',
                        padding: EdgeInsets.symmetric(vertical: 20),
                        textAlign: TextAlign.center,
                      )
                    : Column(
                        children: [
                          CardSales(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            compound: result.value!,
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
