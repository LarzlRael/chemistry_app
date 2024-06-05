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

    return ScaffoldBackground(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Sales basicas'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                                    typeCompound: hidroxidoSelected.value!.type,
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
                  SelectableCardSal(
                      onTap: () =>
                          bottomSheetIones(context, ionSelected, "Buscar ion"),
                      compound: ionSelected.value)
                ],
              ),
              result.value == null
                  ? SimpleText(
                      'Seleccione un hidroxido y un ion para obtener el resultado',
                      padding: EdgeInsets.symmetric(vertical: 20),
                      textAlign: TextAlign.center,
                    )
                  : CardSales(
                      margin: EdgeInsets.only(top: 20),
                      compound: result.value!,
                      height: 0.20,
                    ),
              Spacer(),
              BannerAd(),
            ],
          ),
        ),
      ),
    );
  }
}
