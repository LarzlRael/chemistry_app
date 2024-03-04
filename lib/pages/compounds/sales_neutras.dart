part of '../pages.dart';

class SalesNeutras extends HookWidget {
  const SalesNeutras({super.key});
  static const routeName = 'sales_neutras';
  @override
  Widget build(BuildContext context) {
    final metalSelected = useState<PeriodicTableElement?>(null);
    final ionSelected = useState<Compound?>(null);
    final result = useState<Compound?>(null);
    final mediaQuery = MediaQuery.of(context).size;
    useEffect(() {
      if (metalSelected.value != null && ionSelected.value != null) {
        result.value = generateOneIon(
          metalSelected.value!,
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
                  title: 'Metal',
                  onTap: () => bottomSheetMetals(context, metalSelected),
                  width: mediaQuery.width * 0.4,
                  child: metalSelected.value == null
                      ? Text('Seleccione un metal')
                      : Text(metalSelected.value!.name),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    FontAwesomeIcons.circlePlus,
                  ),
                ),
                SelecteCardForSal(
                  title: 'Ion',
                  width: mediaQuery.width * 0.4,
                  onTap: () => bottomSheetIones(context, ionSelected),
                  child: ionSelected.value == null
                      ? Text('Seleccione un ion')
                      : Text(ionSelected.value!.name),
                ),
              ],
            ),
            result.value == null
                ? Text('Seleccione ambos elementos para ver el resultado.')
                : Column(
                    children: [
                      Container(
                        child: Text(result.value?.name ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: FormulaInText(
                          compoundFormula:
                              getValenceString(result.value!.formula),
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
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
            child: ElementsListTile(
              elements: elements,
              onSelected: (element) {
                /* metalSelected.value = element;
                context.pop(); */
                if (element.valencias.length > 1) {
                  bottomSheetSelecteValence(context, element.valencias);
                } else {
                  metalSelected.value = element;
                  context.pop();
                }
              },
            ),
          ),
        );
      });
}

void bottomSheetSelecteValence(
  BuildContext context,
  List<Valencia> valences,
) {
  /* fix metal group */

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            child: Wrap(
              children: valences
                  .map(
                    (e) => Card(
                      child: Text(
                        e.value.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      /* onTap: () {
                        context.pop(e);
                      }, */
                    ),
                  )
                  .toList(),
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
                ionSelected.value = element;
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
  const SelecteCardForSal({
    super.key,
    this.onTap,
    this.width,
    required this.child,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
        InkWell(
          onTap: onTap,
          child: Card(
            child: Container(
              width: width ?? 125,
              height: 150,
              /* decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
              ), */
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
