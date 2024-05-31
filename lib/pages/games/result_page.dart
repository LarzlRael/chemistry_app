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
                  fontSize: 40,
                  color: secondaryColor,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                SimpleText(
                  gameTitle,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center,
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                SimpleText(
                  'Tu resultado es de',
                  fontSize: 18,
                  textAlign: TextAlign.center,
                ),
                SimpleText(
                  lineHeight: 0,
                  '$aciertos',
                  fontSize: 140,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
                SimpleText(
                  'aciertos',
                  fontSize: 25,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
                SizedBox(height: 20),
                FilledButton(
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
