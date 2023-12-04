part of 'pages.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  List<String> separarElementos(String texto) {
    RegExp regExp = RegExp(r'([a-zA-Z]+|\d+)');
    Iterable<RegExpMatch> matches = regExp.allMatches(texto);
    int counter = 0;
    List<String> elementos = [];
    for (RegExpMatch match in matches) {
      /* if (counter == 0) {
        elementos.add(match.group(0)!.toUpperCase());
      } else {
      } */
      elementos.add(match.group(0)!);
      counter++;
    }

    return elementos;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontSize: 75);
    final compound = separarElementos('Li2O');

    print(compound);
    return Scaffold(
      body: Center(
        child: FlipCard(
          fill: Fill
              .fillBack, // Fill the back side of the card to make in the same size as the front.
          direction: FlipDirection.HORIZONTAL, // default
          side: CardSide.FRONT, // The side to initially display.
          front: cardFlipable(
            Colors.green,
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Que fue munu 🐒',
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
          back: cardFlipable(
            Colors.blue,
            Center(
              child: RichText(
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
            ),
          ),
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
