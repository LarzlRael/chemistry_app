part of '../pages.dart';

class GuessPeriodicElement extends HookWidget {
  const GuessPeriodicElement({super.key});
  static const routeName = 'guess_periodic_element';

  @override
  Widget build(BuildContext context) {
    final optionsGame = useState<GuessPeriodicHelper>(
      generatePeriodicElementOptions(allListPeriodic, 9),
    );
    final isCorrect = useState(false);
    final showCorrectOptionName = useState(true);
    final selectedCardIndex = useState(-1);

    useEffect(() {
      if (isCorrect.value) {
        optionsGame.value = generatePeriodicElementOptions(allListPeriodic, 9);
        selectedCardIndex.value = -1;
        isCorrect.value = false;
      }
    }, [isCorrect.value]);
    return Scaffold(
      body: ScaffoldBackground(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                /* Text('Selecciona el elemento correcto'), */
                ProgresLinearTimer(
                  height: 15,
                  durationMiliseconds: 20000,
                  onTimerFinish: () {},
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Card(
                    /* color: colorByGroup(optionsGame.value.correctAnswer.group), */
                    child: Column(
                      children: [
                        SimpleText(
                          "¿Cual es el nombre de este elemento?",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        Container(
                          /* width: 300,
                          height: 200, */
                          /* padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ), */
                          child: Center(
                            child: /* SimpleText(
                              showCorrectOptionName.value
                                  ? optionsGame.value.correctAnswer.symbol
                                  : optionsGame.value.correctAnswer.name,
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                            ) */
                                ElementCard(
                              element: optionsGame.value.correctAnswer,
                              fontSize: 60,
                              showName: false,
                              borderRadius: 10,
                              size: 150,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                /* SizedBox(height: 15), */
                Expanded(
                  child: AlignedGridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    itemCount: optionsGame.value.listSuffle.length,
                    itemBuilder: (context, int index) {
                      return InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onTap: () {
                          selectedCardIndex.value = index;
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selectedCardIndex.value == index
                                  ? primaryColor
                                  : Colors.transparent,
                            ),
                            padding: EdgeInsets.all(10),
                            width: 100,
                            height: 100,
                            child: Center(
                              child: SimpleText(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                showCorrectOptionName.value
                                    ? optionsGame.value.listSuffle[index].name
                                    : optionsGame
                                        .value.listSuffle[index].symbol,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: secondaryColor,
                    ),
                    onPressed: selectedCardIndex.value != -1
                        ? () {
                            if (optionsGame.value
                                    .listSuffle[selectedCardIndex.value] ==
                                optionsGame.value.correctAnswer) {
                              isCorrect.value = true;
                              return;
                            }
                            GlobalSnackBar.showSnackBar(
                              context,
                              'Respuesta incorrecta',
                            );
                          }
                        : null,
                    child: SimpleText(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      'Comprobar',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
