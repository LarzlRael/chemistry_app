part of '../widgets.dart';

class FormulaInText extends StatelessWidget {
  final List<ValenceCompound> compoundFormula;
  final TextStyle? textStyle;
  final double fontSize;
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
    final exeption = [1, 0];
    return Wrap(
      spacing: gap ?? 0, // Espacio entre los elementos
      children: compoundFormula.map((e) {
        final isOneOrCero =
            compoundFormula.length == 1 ? false : exeption.contains(e.value);
        final position =
            !e.isSuperIndex ? (fontSize / 2.5) : (fontSize / 6) * -1;
        return Wrap(
          spacing: gap ?? 0, // Espacio entre los elementos
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              e.suffix,
              style: textStyle?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: e.color,
              ),
            ),
            Transform.translate(
              offset: Offset(0.0, position),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: isOneOrCero ? 0.0 : 1.0,
                child: Text(
                  e.value.toString(),
                  style: textStyle?.copyWith(
                    fontSize: isOneOrCero ? fontSize! * 0.25 : fontSize! * 0.50,
                    fontWeight: FontWeight.bold,
                    color: isOneOrCero ? Colors.transparent : e.colorValue,
                  ),
                ),
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
