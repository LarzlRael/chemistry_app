part of '../pages.dart';

class GuessPeriodicElement extends HookConsumerWidget {
  const GuessPeriodicElement({super.key});
  static const routeName = 'guess_periodic_element';

  @override
  Widget build(BuildContext context, ref) {
    final optionsGame = useState<GuessPeriodicHelper>(
      generatePeriodicElementOptions(allListPeriodic, 9),
    );
    final isCorrect = useState(false);
    final showCorrectOptionName = useState<bool>(generateRandomBoolean());
    final selectedCardIndex = useState(-1);
    final isSelectedAux = useState<bool?>(null);
    final isBlock = useState(false);
    final correctAnswerAmount = useState(0);

    final colorSchema = Theme.of(context).colorScheme;
    final interstiatAdProviderN = ref.read(interstitialAdProvider.notifier);

    useEffect(() {
      if (isCorrect.value) {
        correctAnswerAmount.value++;
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
    return ScaffoldBackground(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  BackIconButton(
                    icon: Icons.close,
                    size: 35,
                  ),
                  /* SizedBox(width: 5), */
                  Expanded(
                    child: ProgressLinearTimer(
                      height: 15,
                      durationMilliseconds: periodicTimeMilliseconds,
                      onTimerFinish: () {
                        interstiatAdProviderN.addCounterInterstitialAdAndShow();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              gameTitle: 'Adivina el elemento',
                              aciertos: correctAnswerAmount.value,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Card(
                  /* color: colorByGroup(optionsGame.value.correctAnswer.group), */
                  child: Column(
                    children: [
                      SimpleText(
                        "¿Cual es el ${showCorrectOptionName.value ? 'nombre' : 'simbolo'} de este elemento?",
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
                            size: 160,
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
                                    : colorSchema.primary
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
                                child: AutoSizeText(
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: selectedCardIndex.value == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  maxFontSize: 30,
                                  minFontSize: 20,
                                  showCorrectOptionName.value
                                      ? optionsGame.value.listSuffle[index].name
                                      : optionsGame
                                          .value.listSuffle[index].symbol,
                                  textAlign: TextAlign.center,
                                ),
                                /* child: SimpleText(
                                  fontSize:
                                      !showCorrectOptionName.value ? 30 : 16,
                                  fontWeight: FontWeight.w500,
                                  color: selectedCardIndex.value == index
                                      ? Colors.white
                                      : Colors.black,
                                  showCorrectOptionName.value
                                      ? optionsGame.value.listSuffle[index].name
                                      : optionsGame
                                          .value.listSuffle[index].symbol,
                                  textAlign: TextAlign.center,
                                ), */
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
    );
  }
}
