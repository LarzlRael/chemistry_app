part of './widgets.dart';

class SimpleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;

  final Color? color;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final TextAlign? textAlign;
  final double? lineHeight;

  const SimpleText({
    required this.text,
    Key? key,
    this.fontWeight,
    this.padding,
    this.fontSize,
    this.style,
    this.textAlign,
    this.lineHeight,
    this.color,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      child: Text(
        text,
        textAlign: textAlign ?? TextAlign.start,
        style: style ??
            TextStyle(
              height: lineHeight,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 14,
              color: color,
            ),
      ),
    );
  }
}
