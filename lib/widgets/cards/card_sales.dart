part of '../widgets.dart';

class CardSales extends StatelessWidget {
  const CardSales({
    super.key,
    this.width = 0.9,
    this.height = 0.25,
    this.margin,
    this.compound,
    this.fontSize = 35,
  });
  static const routeName = 'card_sales';
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final Compound? compound;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mediaQuery = MediaQuery.of(context).size;
    return Card(
      margin: margin ?? EdgeInsets.symmetric(vertical: 5),
      child: Container(
        /* margin: EdgeInsets.symmetric(vertical: 20), */
        width: mediaQuery.width * width,
        height: mediaQuery.height * height,
        /* padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0), */
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorByCompoundType(compound!.type),
              colorByCompoundType(compound!.type).withOpacity(0.5),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormulaInText(
              compoundFormula: compound!.formula,
              typeCompound: compound!.type,
              fontSize: fontSize,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SimpleText(
              padding: EdgeInsets.symmetric(horizontal: 2.5),
              compound!.name.toCapitalize(),
              style: textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MetalSelectedCard extends StatelessWidget {
  const MetalSelectedCard({
    super.key,
    required this.metalSelected,
    required this.currentValencia,
  });

  final ValueNotifier<PeriodicTableElement?> metalSelected;
  final ValueNotifier<Valencia?> currentValencia;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SimpleText(
          metalSelected.value!.symbol,
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        SimpleText(
          metalSelected.value!.name,
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        SimpleText(
          currentValencia.value!.value.toString(),
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}

void bottomSheetMetals(
  BuildContext context,
  ValueNotifier<PeriodicTableElement?> metalSelected,
  ValueNotifier<Valencia?> valenciaSeleted,
  List<PeriodicTableElement> elementsToSearch,
) {
  /* fix metal group */

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            child: ListTileElementsValences(
              elements: elementsToSearch,
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

void bottomNegativeElementValue(
  BuildContext context,
  ValueNotifier<PeriodicTableElement?> metalSelected,
  ValueNotifier<Valencia?> valenciaSeleted,
) {
  /* fix metal group */

  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
            child: ListTileElementsNegativesValences(
              elements: filterByGroups(salesHidracidas),
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

void bottomSheetByCompounds(
  BuildContext context,
  ValueNotifier<Compound?> compoundSelected,
  List<Compound> elementsToFind,
) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
              child: CompundListTile(
            compounds: elementsToFind,
            onSelected: (element) {
              compoundSelected.value = element;
              context.pop();
            },
          )),
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
              /* isSelected: ionSelected.value != null, */
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
  final double width;
  final String title;
  final Color? color;
  final double height;
  const SelecteCardForSal({
    super.key,
    this.onTap,
    this.width = 125,
    this.height = 150,
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
              width: width,
              height: height,
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
