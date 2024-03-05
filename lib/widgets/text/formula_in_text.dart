part of '../widgets.dart';

class FormulaInText extends StatelessWidget {
  final String compoundFormula;
  final TextStyle? textStyle;
  final double? fontSize;
  const FormulaInText({
    super.key,
    required this.compoundFormula,
    this.textStyle,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final compoundSeparate = splitStringIntoCharacters(compoundFormula);
    return RichText(
      text: TextSpan(
        style: textStyle,
        children: compoundSeparate.map((e) {
          /* is the number is negative in case of ios */
          if (e.contains(RegExp(r'[a-zA-Z]'))) {
            return TextSpan(
              text: e,
              style: textStyle?.copyWith(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            );
          }
          /* change -30 position as the font size */
          final position =
              int.parse(e) > 0 ? (fontSize! / 2.5) : (fontSize! / 2.5) * -1;
          return WidgetSpan(
            child: Transform.translate(
              offset: Offset(0.0, position),
              child: Text(
                int.parse(e) == 1 || int.parse(e) == 0 ? '' : e,
                style: textStyle?.copyWith(
                  fontSize: fontSize! * 0.50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
