part of '../widgets.dart';

class FormulaInText extends StatelessWidget {
  final String compoundFormula;
  final TextStyle? textStyle;
  const FormulaInText({
    super.key,
    required this.compoundFormula,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final compoundSeparate = separarElementos(compoundFormula);
    return RichText(
      text: TextSpan(
        style: textStyle,
        children: compoundSeparate.map((e) {
          /* is the number is negative in case of ios */

          if (e.contains(RegExp(r'[a-zA-Z]'))) {
            return TextSpan(
              text: e,
              style: textStyle,
            );
          }
          /* change -30 position as the font size */
          final position = int.parse(e) > 0 ? 4.0 : -30.0;
          return WidgetSpan(
            child: Transform.translate(
              offset: Offset(0.0, position),
              child: Text(
                int.parse(e) == 1 || int.parse(e) == 0 ? '' : e,
                style: textStyle?.copyWith(
                      fontSize: textStyle!.fontSize! * 0.50,
                      fontWeight: FontWeight.bold,
                    ) ??
                    TextStyle(
                      fontSize:
                          DefaultTextStyle.of(context).style.fontSize! * 0.50,
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
