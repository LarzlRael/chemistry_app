part of '../widgets.dart';

class CardDetailCompound extends StatelessWidget {
  const CardDetailCompound({
    super.key,
    required this.children,
    required this.compoundName,
    required this.background,
    this.extraAction,
    this.extraInfo,
  });
  final List<Widget> children;
  final List<Widget>? extraInfo;
  final String compoundName;
  final Color background;
  final Widget? extraAction;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      child: Container(
        width: size.width * 0.90,
        height: size.height * 0.65,
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
            if (extraAction != null)
              Positioned(
                top: 5,
                right: 5,
                child: extraAction!,
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...children,
                if (extraInfo != null) ...extraInfo!,
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                compoundName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
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
      children: [
        element,
        SimpleText(
          text: elementName,
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
