part of 'pages.dart';

class GamesPage extends HookWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final listSuffle = shuffleList(listPeriodic);
    final firstElement = listSuffle[currentIndex.value];

    return Scaffold(
      appBar: AppBar(
        title: Text('Juegos'),
        actions: [
          TextButton.icon(
            label: Text('Siguiente'),
            onPressed: () {
              currentIndex.value++;
              if (currentIndex.value == listSuffle.length) {
                currentIndex.value = 0;
              }
            },
            icon: Icon(
              Icons.chevron_right_rounded,
              size: 40,
            ),
          ),
        ],
      ),
      body: Center(
        child: CardFlipablePeriodicElement(
          backColor: Colors.blue,
          frontColor: Colors.green,
          child: Container(),
          firstElement: firstElement,
        ),
      ),
    );
  }

  Widget cardFlipable(Color color, Widget child) {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

class CardFlipablePeriodicElement extends StatelessWidget {
  const CardFlipablePeriodicElement({
    Key? key,
    required this.child,
    required this.frontColor,
    required this.backColor,
    required this.firstElement,
  }) : super(key: key);

  final Color frontColor;
  final Color backColor;
  final Widget child;
  final PeriodicTableElement firstElement;

  @override
  Widget build(BuildContext context) {
    final compound = separarElementos(firstElement.symbol);
    final textStyle = TextStyle(color: Colors.white, fontSize: 75);
    return FlipCard(
      fill: Fill
          .fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      side: CardSide.FRONT, // The side to initially display.
      back: cardFlipable(
        Colors.blue,
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: textStyle,
                      children: compound.map((e) {
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
                                '2',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                      }).toList(),
                    ),
                  ),
                  firstElement.atomicNumber.isEmpty
                      ? SizedBox()
                      : SimpleText(
                          text: firstElement.atomicNumber,
                          color: Colors.white,
                          fontSize: 30,
                        ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Wrap(
                  children: firstElement.valencias.map((e) {
                return SimpleText(
                  text: e.value.toString(),
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                );
              }).toList()),
            ),
          ],
        ),
      ),
      front: cardFlipable(
        Colors.green,
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                firstElement.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardFlipable(Color color, Widget child) {
  return Container(
    width: 200,
    height: 300,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: color,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: child,
  );
}
