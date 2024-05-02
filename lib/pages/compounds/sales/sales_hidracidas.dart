part of '../../pages.dart';

class SalesHidracidas extends HookWidget {
  const SalesHidracidas({super.key});
  static const routeName = 'sales_hidracidas';
  @override
  Widget build(BuildContext context) {
    final result = useState<Compound?>(null);
    final firstMetalSelected = useState<PeriodicTableElement?>(null);
    final secondMetalSelected = useState<PeriodicTableElement?>(null);
    final firstCurrentValencia = useState<Valencia?>(null);
    final secondCurrentValencia = useState<Valencia?>(null);

    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    useEffect(() {
      if (firstMetalSelected.value != null &&
          secondMetalSelected.value != null &&
          firstCurrentValencia.value != null &&
          secondCurrentValencia.value != null) {
        result.value = generateSalHidracida(
          firstMetalSelected.value!,
          secondMetalSelected.value!,
          firstCurrentValencia.value!,
          secondCurrentValencia.value!,
        );
      }
    }, [firstMetalSelected.value, secondMetalSelected.value]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales hidracidas'),
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
                          color: firstMetalSelected.value == null
                              ? null
                              : colorByGroup(firstMetalSelected.value!.group),
                          title: 'Acido Hidracido',
                          /* height: mediaQuery.height * 0.15, */
                          onTap: () => bottomNegativeElementValue(
                            context,
                            firstMetalSelected,
                            firstCurrentValencia,
                          ),
                          width: mediaQuery.width * 0.4,
                          child: firstMetalSelected.value == null
                              ? Text(
                                  'Selecciona un acido hidracido',
                                  textAlign: TextAlign.center,
                                  style: textTheme.labelMedium,
                                )
                              : MetalSelectedCard(
                                  metalSelected: firstMetalSelected,
                                  currentValencia: firstCurrentValencia,
                                ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(FontAwesomeIcons.circlePlus),
                    ),
                    SelecteCardForSal(
                      color: secondMetalSelected.value == null
                          ? null
                          : colorByGroup(secondMetalSelected.value!.group),
                      title: 'Metal',
                      onTap: () => bottomSheetMetals(
                          context,
                          secondMetalSelected,
                          secondCurrentValencia,
                          generateMetals(metalGroup)),
                      width: mediaQuery.width * 0.4,
                      child: secondMetalSelected.value == null
                          ? Text(
                              'Seleccione un metal',
                              textAlign: TextAlign.center,
                              style: textTheme.labelMedium,
                            )
                          : MetalSelectedCard(
                              metalSelected: secondMetalSelected,
                              currentValencia: secondCurrentValencia,
                              sizeReduce: 0.85,
                            ),
                    ),
                  ],
                ),
                result.value == null
                    ? SimpleText(
                        'Seleccione un acido hidracido y un metal para formar una sal hidracida',
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
