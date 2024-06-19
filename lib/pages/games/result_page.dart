part of '../pages.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.gameTitle,
    required this.aciertos,
  });
  static const routeName = 'result_page';

  final String gameTitle;
  final int aciertos;

  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;
    return PopScope(
      canPop: false,
      /* onPopInvoked: (didpop) {
        Navigator.of(context)
          ..pop()
          ..pop();
      }, */
      child: Scaffold(
        body: SafeArea(
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              /* crossAxisAlignment: CrossAxisAlignment.center, */
              children: [
                SimpleText(
                  '¡Bien jugado!',
                  fontSize: 35,
                  color: colorSchema.primary,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                SimpleText(
                  gameTitle,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                SimpleText(
                  'Tu resultado es de',
                  fontSize: 18,
                  textAlign: TextAlign.center,
                  color: colorSchema.primary,
                  fontWeight: FontWeight.w600,
                ),
                SimpleText(
                  lineHeight: 0,
                  '$aciertos',
                  fontSize: 140,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  color: colorSchema.primary,
                ),
                SimpleText(
                  'aciertos',
                  fontSize: 25,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                  color: colorSchema.primary,
                ),
                SizedBox(height: 30),
                FilledButton(
                  style: TextButton.styleFrom(
                    backgroundColor: colorSchema.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 50,
                    child: Center(
                      child: SimpleText(
                        'Volver a jugar',
                        textAlign: TextAlign.center,
                        fontSize: 20,
                        color: Colors.white,
                        /* color: Colors.white, */
                      ),
                    ),
                  ),
                  /* color: primaryColor, */
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
