part of '../widgets.dart';

class CirclePresentation extends StatelessWidget {
  final String symbol1;
  final String symbol2;
  final Color color1;
  final Color color2;
  final EdgeInsets? margin;
  const CirclePresentation({
    super.key,
    required this.symbol1,
    required this.symbol2,
    required this.color1,
    required this.color2,
    this.margin,
  });
  static const routeName = 'circle_presentation';
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      /* color: Colors.blue, */
      width: double.infinity,
      height: 150,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: widgetCircle(symbol1, color: color1, fontSize: 40),
          ),
          Align(
            alignment: Alignment.topRight,
            child: widgetCircle(symbol2, color: color2, fontSize: 40),
          ),
          Align(
            alignment: Alignment.center,
            child: Transform.rotate(
              angle: -15 * math.pi / 180,
              child: Container(
                width: 160,
                height: 20,
                decoration: BoxDecoration(
                  /* borderRadius: BorderRadius.circular(10), */
                  gradient: LinearGradient(
                    colors: [
                      color1,
                      color2,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

widgetCircle(
  String text, {
  Color color = Colors.red,
  double size = 100,
  double fontSize = 20,
}) {
  return Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color,
      /* gradient: LinearGradient(
        colors: [
          color,
          color.withOpacity(0.8),
        ],
      ), */
      /*  gradient: RadialGradient(
        center: Alignment(-0.8, -0.6),
        colors: [
          color,
          color.withOpacity(0.8),
        ],
        radius: 1.0,
      ), */
      shape: BoxShape.circle,
    ),
    child: Center(
      child: SimpleText(
        text,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
