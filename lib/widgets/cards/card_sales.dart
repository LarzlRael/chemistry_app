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
