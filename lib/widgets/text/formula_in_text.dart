part of '../widgets.dart';

class FormulaInText extends StatelessWidget {
  final List<ValenceCompound> compoundFormula;
  final TextStyle? textStyle;
  final double? fontSize;
  final TypeCompound? typeCompound;
  final double? gap;

  const FormulaInText({
    Key? key,
    required this.compoundFormula,
    this.textStyle,
    this.fontSize = 16.0,
    this.typeCompound,
    this.gap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: gap ?? 0, // Espacio entre los elementos
      children: compoundFormula.map((e) {
        final position =
            !e.isSuperIndex ? (fontSize! / 1.5) : (fontSize! / 6) * -1;
        return Wrap(
          spacing: gap ?? 0, // Espacio entre los elementos
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              e.suffix,
              style: textStyle?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Transform.translate(
              offset: Offset(0.0, position),
              child: Text(
                e.value == 1 || e.value == 0 ? '' : e.value.toString(),
                style: textStyle?.copyWith(
                  fontSize: fontSize! * 0.50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
