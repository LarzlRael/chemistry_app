part of '../pages.dart';

class SalesNeutras extends HookWidget {
  const SalesNeutras({super.key});
  static const routeName = 'sales_neutras';
  @override
  Widget build(BuildContext context) {
    final metalSelected = useState<PeriodicTableElement?>(null);
    final ionSelected = useState<Compound?>(null);
    final result = useState<Compound?>(null);
    final currentValencia = useState<Valencia?>(null);
    final mediaQuery = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    final styleMetalCard = textTheme.titleLarge!.copyWith(
      color: Colors.white,
    );

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
                  onTap: () => bottomSheetMetals(
                    context,
                    metalSelected,
                    currentValencia,
                  ),
                  width: mediaQuery.width * 0.4,
                  child: metalSelected.value == null
                      ? Text(
                          'Seleccione un metal',
                          textAlign: TextAlign.center,
                          style: textTheme.labelMedium,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              metalSelected.value!.name,
                              style: styleMetalCard,
                            ),
                            Text(
                              currentValencia.value?.value.toString() ?? '',
                              style: styleMetalCard,
                            ),
                            Text(
                              metalSelected.value?.symbol ?? '',
                              style: styleMetalCard,
                            ),
                          ],
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
                    text:
                        'Seleccione ambos elementos para ver el formar una sal neutra.',
                    padding: EdgeInsets.symmetric(vertical: 20),
                    textAlign: TextAlign.center,
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: FormulaInText(
                          compoundFormula: result.value!.formula,
                          typeCompound: result.value!.type,
                          fontSize: 60,
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ),
                      SimpleText(
                        text: result.value!.name.toCapitalize(),
                        style: textTheme.headlineMedium,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

void bottomSheetMetals(
  BuildContext context,
  ValueNotifier<PeriodicTableElement?> metalSelected,
  ValueNotifier<Valencia?> valenciaSeleted,
) {
  /* fix metal group */
  final elements = generateMetals(metalGroup);
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            child: ListTileElementsValences(
              elements: elements,
              onSelected: (element, valence) {
                valenciaSeleted.value = valence;
                metalSelected.value = element;
                context.pop();
              },
            ),
          ),
        );
      });
}

void bottomSheetIones(
  BuildContext context,
  ValueNotifier<Compound?> ionSelected,
) {
  final elements = generateIonesByGroupsElements(noMetalGroup);
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            child: CompundListTile(
              compounds: elements,
              onSelected: (element) {
                ionSelected.value = element.copyWith();
                context.pop();
              },
            ),
          ),
        );
      });
}

class SelecteCardForSal extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  final double? width;
  final String title;
  final Color? color;
  const SelecteCardForSal({
    super.key,
    this.onTap,
    this.width,
    required this.child,
    required this.title,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onTap: onTap,
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                gradient: color == null
                    ? null
                    : LinearGradient(
                        colors: [
                          color!,
                          color!.withOpacity(0.8),
                        ],
                      ),
                borderRadius: BorderRadius.circular(10),
              ),
              width: width ?? 125,
              height: 150,
              child: Center(
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
