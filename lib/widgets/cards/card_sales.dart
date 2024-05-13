part of '../widgets.dart';

class CardSales extends StatelessWidget {
  const CardSales({
    super.key,
    this.width = 0.9,
    this.height = 0.25,
    this.margin,
    this.compound,
    this.fontSize = 35,
    this.color1,
    this.color2,
  });
  static const routeName = 'card_sales';
  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final Compound? compound;
  final double fontSize;
  final Color? color1;
  final Color? color2;
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
              color1 ?? colorByCompoundType(compound!.type),
              color2 ?? colorByCompoundType(compound!.type).withOpacity(0.5),
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
    this.showPrefix = true,
    this.sizeReduce = 1,
  });
  final double sizeReduce;
  final bool showPrefix;
  final ValueNotifier<PeriodicTableElement?> metalSelected;
  final ValueNotifier<Valencia?> currentValencia;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: SimpleText(
            lineHeight: 0,
            metalSelected.value!.symbol,
            fontSize: 45 * sizeReduce,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SimpleText(
          lineHeight: 0,
          metalSelected.value!.name,
          color: Colors.white,
          fontSize: 30 * sizeReduce,
          fontWeight: FontWeight.w600,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleText(
              lineHeight: 0,
              currentValencia.value!.value.toString(),
              fontSize: 25 * sizeReduce,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(width: 5),
            if (metalSelected.value!.valencias.length > 1 && showPrefix)
              SimpleText(
                "(${currentValencia.value!.suffix.name.snakeCaseToWords().toCapitalize()})",
                fontSize: 15 * sizeReduce,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
          ],
        ),
      ],
    );
    /* return CardElement(
      element: metalSelected.value!,
      valencias: [currentValencia.value!],
      group: '',
    ); */
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
  String inputLabel,
) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Container(
              child: CompundListTile(
            inputLabel: inputLabel,
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
  String inputLabel,
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
              inputLabel: inputLabel,
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
  final EdgeInsetsGeometry? padding;

  const SelecteCardForSal({
    super.key,
    this.onTap,
    this.width = 125,
    this.height = 150,
    this.color,
    this.padding,
    required this.child,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        children: [
          SimpleText(
            title,
            fontSize: 18,
            fontWeight: FontWeight.w500,
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
      ),
    );
  }
}

class SelectableCardSal extends HookWidget {
  final Function()? onTap;
  final Compound? compound;
  final double width;
  final double height;

  const SelectableCardSal({
    super.key,
    this.onTap,
    this.width = 125,
    this.height = 150,
    required this.compound,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
    return Column(
      children: [
        Row(
          children: [
            SimpleText(
              "Ion",
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            if (compound != null)
              Container(
                margin: EdgeInsets.only(left: 5),
                child: GestureDetector(
                  onTap: () => cardKey.currentState!.toggleCard(),
                  child: Icon(
                    Icons.change_circle,
                    /* color: Colors.blue, */
                  ),
                ),
              ),
          ],
        ),
        InkWell(
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onTap: onTap,
          child: FlipCard(
            key: cardKey,
            flipOnTouch: false,
            front: Card(
              child: Container(
                decoration: BoxDecoration(
                  gradient: compound == null
                      ? null
                      : LinearGradient(
                          colors: [
                            colorByCompoundType(compound!.type),
                            colorByCompoundType(compound!.type)
                                .withOpacity(0.8),
                          ],
                        ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width,
                height: height,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 350),
                  child: Center(
                    child: compound == null
                        ? Text(
                            'Seleccione un ion',
                            style: textTheme.labelMedium,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FormulaInText(
                                compoundFormula: compound!.formula,
                                typeCompound: compound!.type,
                                fontSize: 30,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              SimpleText(
                                compound!.name.toCapitalize(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.5, vertical: 2.5),
                                style: textTheme.headlineMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
            back: Card(
              child: Container(
                decoration: BoxDecoration(
                  gradient: compound == null
                      ? null
                      : LinearGradient(
                          colors: [
                            colorByCompoundType(compound!.compound!.type),
                            colorByCompoundType(compound!.compound!.type)
                                .withOpacity(0.8),
                          ],
                        ),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width,
                height: height,
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 350),
                  child: Center(
                    child: compound == null
                        ? Text(
                            'Seleccione un ion',
                            style: textTheme.labelMedium,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FormulaInText(
                                compoundFormula: compound!.compound!.formula,
                                typeCompound: compound!.compound!.type,
                                fontSize: 30,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              SimpleText(
                                compound!.compound!.name.toCapitalize(),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.5, vertical: 2.5),
                                style: textTheme.headlineMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
