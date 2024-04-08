part of '../widgets.dart';

enum Plus2ElementsDirecction { horizontal, vertical }

class Plus_2_Elements extends StatelessWidget {
  const Plus_2_Elements({
    super.key,
    required this.element1,
    required this.element2,
    this.direcction = Plus2ElementsDirecction.vertical,
  });
  final Widget element1;
  final Widget element2;
  final Plus2ElementsDirecction direcction;
  @override
  Widget build(BuildContext context) {
    return direcction == Plus2ElementsDirecction.vertical
        ? VerticalPlus(
            element1: element1,
            element2: element2,
          )
        : HorizontalPlus(
            element1: element1,
            element2: element2,
          );
  }
}

class VerticalPlus extends StatelessWidget {
  const VerticalPlus({
    super.key,
    required this.element1,
    required this.element2,
  });

  final Widget element1;
  final Widget element2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            FontAwesomeIcons.circlePlus,
            color: Colors.white,
            size: 40,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            element1,
            element2,
          ],
        )
      ],
    );
  }
}

class HorizontalPlus extends StatelessWidget {
  const HorizontalPlus({
    super.key,
    required this.element1,
    required this.element2,
  });

  final Widget element1;
  final Widget element2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        element1,
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            FontAwesomeIcons.circlePlus,
            color: Colors.white,
            size: 40,
          ),
        ),
        element2,
      ],
    );
  }
}
