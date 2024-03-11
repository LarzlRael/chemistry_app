part of '../pages.dart';

class GuessPeriodicElement extends HookWidget {
  const GuessPeriodicElement({super.key});
  static const routeName = 'guess_periodic_element';
  @override
  Widget build(BuildContext context) {
    final optionsGame = useState<GuessPeriodicHelper>(
      generateOptions(allListPeriodic, 5),
    );
    final isCorrect = useState(false);
    final selectedCardIndex = useState(-1);

    useEffect(() {
      if (isCorrect.value) {
        optionsGame.value = generateOptions(allListPeriodic, 5);
        selectedCardIndex.value = -1;
        isCorrect.value = false;
      }
    }, [isCorrect.value]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivina el elemento'),
      ),
      body: Column(
        children: [
          Text('Selecciona el elemento correcto'),
          Card(
            child: Container(
              width: 150,
              height: 100,
              /* padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ), */
              child: Center(
                child: SimpleText(
                  text: optionsGame.value.correctAnswer.symbol,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
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
                              ? Colors.green
                              : Colors.transparent,
                          width: 4,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      width: 100,
                      height: 100,
                      child: Center(
                        child: SimpleText(
                          text: optionsGame.value.listSuffle[index].name,
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
              onPressed: selectedCardIndex.value != -1
                  ? () {
                      if (optionsGame
                              .value.listSuffle[selectedCardIndex.value] ==
                          optionsGame.value.correctAnswer) {
                        isCorrect.value = true;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Respuesta incorrecta'),
                          ),
                        );
                      }
                    }
                  : null,
              child: Text('Comprobar'),
            ),
          ),
        ],
      ),
    );
  }
}
