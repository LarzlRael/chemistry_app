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
    final showCorrectOptionName = useState<bool>(generateRandomBoolean());
    final selectedCardIndex = useState(-1);
    final isSelectedAux = useState<bool?>(null);
    final isBlock = useState(false);

    useEffect(() {
      if (isCorrect.value) {
        isBlock.value = true;
        isSelectedAux.value = true;
        Future.delayed(Duration(milliseconds: 1500), () {
          isSelectedAux.value = null;
          isBlock.value = false;
          optionsGame.value =
              generatePeriodicElementOptions(allListPeriodic, 9);
          selectedCardIndex.value = -1;
          isCorrect.value = false;
          showCorrectOptionName.value = generateRandomBoolean();
        });
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
                  margin: EdgeInsets.symmetric(vertical: 10),
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
                          child: Center(
                            child: ElementCard(
                              showOnlyName: !showCorrectOptionName.value,
                              element: optionsGame.value.correctAnswer,
                              fontSize: 60,
                              showName: false,
                              borderRadius: 10,
                              size: 175,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
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
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: selectedCardIndex.value == index
                                  ? selectedCardIndex.value == index &&
                                          isSelectedAux.value != null
                                      ? isSelectedAux.value!
                                          ? Colors.green
                                          : Colors.red
                                      : primaryColor
                                  : Colors.white,
                            ),
                            width: 100,
                            height: 100,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 2,
                                  right: 2,
                                  child: Visibility(
                                    visible: selectedCardIndex.value == index &&
                                        isSelectedAux.value != null,
                                    child: FadeIn(
                                      duration: Duration(milliseconds: 250),
                                      child: isSelectedAux.value != null
                                          ? Icon(
                                              isSelectedAux.value!
                                                  ? Icons.check_circle
                                                  : Icons.cancel,
                                              size: 30,
                                            )
                                          : SizedBox(),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SimpleText(
                                    fontSize:
                                        !showCorrectOptionName.value ? 30 : 16,
                                    fontWeight: FontWeight.w500,
                                    color: selectedCardIndex.value == index
                                        ? Colors.white
                                        : Colors.black,
                                    showCorrectOptionName.value
                                        ? optionsGame
                                            .value.listSuffle[index].name
                                        : optionsGame
                                            .value.listSuffle[index].symbol,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: VerifyButton(
                    onPressed: selectedCardIndex.value != -1 && !isBlock.value
                        ? () {
                            if (isBlock.value) return;

                            if (optionsGame.value
                                    .listSuffle[selectedCardIndex.value].name ==
                                optionsGame.value.correctAnswer.name) {
                              isCorrect.value = true;
                              return;
                            }
                            isSelectedAux.value = false;
                            isBlock.value = true;
                            Future.delayed(Duration(milliseconds: 1000), () {
                              isSelectedAux.value = null;
                              isBlock.value = false;
                              selectedCardIndex.value = -1;
                            });
                            /*  GlobalSnackBar.showSnackBar(
                            context,
                            'Respuesta incorrecta',
                            backgroundColor: Colors.red,
                          ); */
                          }
                        : null,
                    titleButton: 'Comprobar',
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
