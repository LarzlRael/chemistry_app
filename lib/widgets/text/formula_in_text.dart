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
          if (e.contains(RegExp(r'[a-zA-Z]'))) {
            return TextSpan(
              text: e,
              style: textStyle,
            );
          } else {
            return WidgetSpan(
              child: Transform.translate(
                offset: const Offset(0.0, 4.0),
                child: Text(
                  e,
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
          }
        }).toList(),
      ),
    );
  }
}