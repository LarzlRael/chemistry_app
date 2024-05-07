part of '../pages.dart';

class GuessCompoundGame extends HookConsumerWidget {
  const GuessCompoundGame({super.key});
  static const routeName = 'guess_compund_element';

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;

    final isCorrect = useState(false);

    final isSelectedAux = useState<bool?>(null);
    final isBlock = useState(false);
    final selectedCardIndex = useState<int>(-1);
    final correctAnswerAmount = useState<int>(0);
    final compoundGuessGame = useState<CompoundGuessGame>(
      generateCompoundGuessGame(),
    );

    useEffect(() {
      ref.read(interstiatAdProvider.notifier).loadAd();
      return null;
    }, []);

    useEffect(() {
      if (isCorrect.value) {
        isBlock.value = true;
        correctAnswerAmount.value++;
        isSelectedAux.value = true;
        Future.delayed(Duration(milliseconds: 1500), () {
          isSelectedAux.value = null;
          isBlock.value = false;
          compoundGuessGame.value = generateCompoundGuessGame();
          selectedCardIndex.value = -1;
          isCorrect.value = false;
        });

        /* isCorrect.value = false; */
      }
    }, [isCorrect.value]);
    return Scaffold(
      /*  appBar: AppBar(
        title: Text('Adivina el compuesto químico'),
      ), */
      body: ScaffoldBackground(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ProgresLinearTimer(
                  height: 15,
                  durationMiliseconds: 80000,
                  onTimerFinish: () {
                    addCounterIntersitialAd(
                        () => ref.read(interstiatAdProvider.notifier).showAd());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          gameTitle: 'Adivina el compuesto',
                          aciertos: correctAnswerAmount.value,
                        ),
                      ),
                    );
                  },
                ),
                /* Text('Selecciona el elemento correcto'), */
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Card(
                    /* color: colorByGroup(optionsGame.value.correctAnswer.group), */
                    child: Container(
                      width: size.width * 0.90,
                      height: size.height * 0.35,
                      /* padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ), */
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SimpleText(
                              "Cual es el nombre del compuesto químico de",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            FormulaInText(
                              compoundFormula: compoundGuessGame
                                  .value.correctElement.formula,
                              gap: 2.5,
                              fontSize: 40,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                /* SizedBox(height: 15), */
                /* Spacer */
                /* Spacer(), */
                Expanded(
                  child: ListView.builder(
                    itemCount: compoundGuessGame.value.elements.length,
                    itemBuilder: (context, int index) {
                      final compound = compoundGuessGame.value.elements[index];
                      return InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        onTap: () {
                          if (isBlock.value) return;
                          selectedCardIndex.value = index;
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: selectedCardIndex.value == index
                                  ? selectedCardIndex.value == index &&
                                          isSelectedAux.value != null
                                      ? isSelectedAux.value!
                                          ? Colors.green
                                          : Colors.red
                                      : primaryColor
                                  : Colors.white,
                            ),
                            padding: EdgeInsets.all(10),
                            width: 100,
                            height: 60,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SimpleText(
                                    compound.name,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.center,
                                    color: selectedCardIndex.value == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
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
                                              size: 40,
                                            )
                                          : Container(
                                              child: Text("por defecnto")),
                                    ),
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
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: double.infinity,
                  child: VerifyButton(
                    onPressed: selectedCardIndex.value != -1 && !isBlock.value
                        ? () {
                            if (isBlock.value) return;

                            if (compoundGuessGame.value
                                    .elements[selectedCardIndex.value].name ==
                                compoundGuessGame.value.correctElement.name) {
                              isCorrect.value = true;
                              return;
                            }
                            isSelectedAux.value = false;
                            isBlock.value = true;
                            Future.delayed(Duration(milliseconds: 1500), () {
                              isSelectedAux.value = null;
                              isBlock.value = false;
                              selectedCardIndex.value = -1;
                            });
                          }
                        : null,
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
