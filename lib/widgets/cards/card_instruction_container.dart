part of '../widgets.dart';

class CardInstructionContainer extends StatelessWidget {
  const CardInstructionContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 5),
              width: 40,
              height: 4.5,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

Widget lineSeparator() {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: Colors.white,
          width: 2,
        ),
      ),
    ),
  );
}

Widget exampleLabel() {
  return SimpleText(
    'Ejemplo:',
    padding: EdgeInsets.symmetric(vertical: 5),
    fontSize: 20,
    fontWeight: FontWeight.w600,
    /* textAlign: TextAlign.center, */
  );
}
