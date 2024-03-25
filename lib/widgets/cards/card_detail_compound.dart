part of '../widgets.dart';

class CardDetailCompound extends HookWidget {
  const CardDetailCompound({
    this.formulaSize = 90,
    super.key,
    required this.children,
    required this.compound,
    required this.background,
    this.height = 0.65,
    this.extraAction,
    this.extraInfo,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final double height;
  final List<Widget> children;
  final List<Widget>? extraInfo;
  final Compound compound;
  final Color background;
  final Widget? extraAction;
  final double formulaSize;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSimplify = useState(false);

    return Card(
      child: Container(
        width: size.width * 0.90,
        height: size.height * height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              background,
              background.withOpacity(0.6),
            ],
          ),
        ),
        child: Stack(
          children: [
            if (compound.type != TypeCompound.ion &&
                compound.formula.first.isSimplified)
              Positioned(
                top: 5,
                right: 5,
                child: CardsElementsValences(
                  onPressed: () {
                    isSimplify.value = !isSimplify.value;
                  },
                  isShowWithOutSimplify: isSimplify.value,
                ),
              ),
            Column(
              mainAxisAlignment: mainAxisAlignment,
              /* crossAxisAlignment: CrossAxisAlignment.center, */
              children: [
                ...children,
                /* FormulaInText(
                  gap: 1,
                  fontSize: formulaSize,
                  compoundFormula: isSimplify.value
                      ? compound.formula
                          .map((e) => e.copyWith(value: e.value * 2))
                          .toList()
                      : compound.formula,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ), */

                if (extraInfo != null) ...extraInfo!,
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FormulaInText(
                    gap: 1,
                    fontSize: formulaSize,
                    compoundFormula: isSimplify.value
                        ? compound.formula
                            .map((e) => e.copyWith(value: e.value * 2))
                            .toList()
                        : compound.formula,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  compound.type == TypeCompound.ion
                      ? SizedBox()
                      : ShowMessageSimply(
                          isShowWithOutSimplify:
                              compound.formula.first.isSimplified,
                          isSimplify: isSimplify.value,
                        ),
                  Text(
                    compound.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElementAndAndName extends StatelessWidget {
  const ElementAndAndName({
    super.key,
    required this.element,
    required this.elementName,
    this.padding,
    this.fontSize = 25,
  });
  final Widget element;
  final String elementName;
  final EdgeInsets? padding;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        element,
        SimpleText(
          elementName,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          textAlign: TextAlign.center,
          padding: padding,
        ),
      ],
    );
  }
}
