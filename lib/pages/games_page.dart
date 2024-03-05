part of 'pages.dart';

class GamesPage extends HookWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final listSuffle = shuffleList(allListPeriodic);
    final firstElement = listSuffle[currentIndex.value];
    final pageViewController = usePageController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Juegos'),
        actions: [
          /* TextButton.icon(
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
          ), */
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
              onPressed: () {
                currentIndex.value++;
                if (currentIndex.value == listSuffle.length) {
                  currentIndex.value = 0;
                }
                pageViewController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              icon: Icon(
                Icons.chevron_left,
                size: 40,
              ),
              label: Text(
                "Siguiente",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: CardFlipablePeriodicElement(
          pageViewController: pageViewController,
          backColor: Colors.blue,
          frontColor: Colors.green,
          child: Container(),
          periodicElement: firstElement,
        ),
      ),
    );
  }
}

class CardFlipablePeriodicElement extends StatelessWidget {
  final PageController? pageViewController;
  const CardFlipablePeriodicElement({
    this.pageViewController,
    Key? key,
    required this.child,
    required this.frontColor,
    required this.backColor,
    required this.periodicElement,
  }) : super(key: key);

  final Color frontColor;
  final Color backColor;
  final Widget child;
  final PeriodicTableElement periodicElement;

  @override
  Widget build(BuildContext context) {
    /* final compound = separarElementos(firstElement.symbol); */
    final textStyle = TextStyle(color: Colors.black, fontSize: 75);
    return PageView.builder(
        controller: pageViewController,
        scrollDirection: Axis.vertical,
        itemCount: allListPeriodic.length,
        itemBuilder: (_, index) {
          final compoundSeparate =
              splitStringIntoCharacters(allListPeriodic[index].symbol);
          final compound = allListPeriodic[index];
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
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            }).toList(),
                          ),
                        ),
                        compound.atomicNumber.isEmpty
                            ? SizedBox()
                            : SimpleText(
                                text: compound.atomicNumber,
                                color: Colors.black,
                                fontSize: 30,
                              ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Wrap(
                        children: compound.valencias.map((e) {
                      return SimpleText(
                        text: e.value.toString(),
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      );
                    }).toList()),
                  ),
                ],
              ),
            ),
            front: cardFlipable(
              colorByGroup(compound.group),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      compound.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget cardFlipable(Color color, Widget child) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      /* borderRadius: BorderRadius.circular(15), */
      color: color,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          color.withOpacity(0.7),
          color,
        ],
      ),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    ),
    /* width: 200,
    height: 300, */
    child: child,
  );
}
