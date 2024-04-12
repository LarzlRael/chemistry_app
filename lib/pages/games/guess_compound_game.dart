part of '../pages.dart';

class GuessCompoundGame extends HookWidget {
  const GuessCompoundGame({super.key});
  static const routeName = 'guess_periodic_element';
  @override
  Widget build(BuildContext context) {
    final optionsGame = useState<GuessPeriodicHelper>(
      generatePeriodicElementOptions(allListPeriodic, 6),
    );
    final isCorrect = useState(false);
    final showCorrectOptionName = useState(true);
    final selectedCardIndex = useState(-1);

    useEffect(() {
      if (isCorrect.value) {
        optionsGame.value = generatePeriodicElementOptions(allListPeriodic, 6);
        selectedCardIndex.value = -1;
        isCorrect.value = false;
      }
    }, [isCorrect.value]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivina el elemento'),
      ),
      body: ScaffoldBackground(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              /* Text('Selecciona el elemento correcto'), */
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Card(
                  color: colorByGroup(optionsGame.value.correctAnswer.group),
                  child: Container(
                    width: 150,
                    height: 100,
                    /* padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ), */
                    child: Center(
                      child: SimpleText(
                        showCorrectOptionName.value
                            ? optionsGame.value.correctAnswer.symbol
                            : optionsGame.value.correctAnswer.name,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                            border: Border.all(
                              color: selectedCardIndex.value == index
                                  ? primaryColor
                                  : Colors.transparent,
                              width: 4,
                            ),
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
                                  : optionsGame.value.listSuffle[index].symbol,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                  ),
                  onPressed: selectedCardIndex.value != -1
                      ? () {
                          if (optionsGame
                                  .value.listSuffle[selectedCardIndex.value] ==
                              optionsGame.value.correctAnswer) {
                            isCorrect.value = true;
                            return;
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Respuesta incorrecta'),
                            ),
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
    );
  }
}
