part of 'pages.dart';

class GamesPage extends HookWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final listSuffle = shuffleList(allListPeriodic);
    final firstElement = listSuffle[currentIndex.value];
    final pageViewController = usePageController();
    useEffect(() {
      ShakeDetector detector = ShakeDetector.autoStart(
        onPhoneShake: () {
          /* ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Shake!'),
            ),
          ); */
          pageViewController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          // Do stuff on phone shake
        },
        minimumShakeCount: 1,
        shakeSlopTimeMS: 500,
        shakeCountResetTime: 3000,
        shakeThresholdGravity: 2.7,
      );
      return () {
        detector.stopListening();
      };
    }, []);
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
          listPeriodic: listSuffle,
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
    required this.frontColor,
    required this.backColor,
    required this.listPeriodic,
  }) : super(key: key);

  final Color frontColor;
  final Color backColor;
  final List<PeriodicTableElement> listPeriodic;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: pageViewController,
      scrollDirection: Axis.vertical,
      itemCount: listPeriodic.length,
      itemBuilder: (_, index) {
        final compound = listPeriodic[index];
        return FlipCard(
          fill: Fill
              .fillBack, // Fill the back side of the card to make in the same size as the front.
          direction: FlipDirection.HORIZONTAL, // default
          side: CardSide.FRONT, // The side to initially display.
          back: cardFlipable(
            colorByGroup(compound.group),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SimpleText(
                        compound.symbol,
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                      SimpleText(
                        compound.name,
                        color: Colors.white,
                        fontSize: 60,
                      ),
                      SimpleText(
                        compound.valencias
                            .map((e) => "+" + e.value.toString())
                            .join(' '),
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 20,
                    child: SimpleText(
                      compound.group.name.toCapitalize(),
                      color: Colors.white,
                      fontSize: 30,
                    )),
              ],
            ),
          ),
          front: cardFlipable(
            colorByGroup(compound.group),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleText(
                    compound.symbol,
                    color: Colors.white,
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
