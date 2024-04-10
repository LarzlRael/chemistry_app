part of '../widgets.dart';

enum Plus2ElementsDirection { horizontal, vertical }

class Plus2Elements extends StatelessWidget {
  const Plus2Elements({
    super.key,
    required this.element1,
    required this.element2,
    this.direction = Plus2ElementsDirection.vertical,
    this.iconPlusColor = Colors.white,
    this.iconSize = 40,
  });
  final Widget element1;
  final Widget element2;
  final Color iconPlusColor;
  final Plus2ElementsDirection direction;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return direction == Plus2ElementsDirection.vertical
        ? VerticalPlus(
            element1: element1,
            element2: element2,
            iconPlusColor: iconPlusColor,
            iconSize: iconSize,
          )
        : HorizontalPlus(
            element1: element1,
            element2: element2,
            iconPlusColor: iconPlusColor,
            iconSize: iconSize,
          );
  }
}

class VerticalPlus extends StatelessWidget {
  const VerticalPlus({
    super.key,
    required this.element1,
    required this.element2,
    this.iconPlusColor = Colors.white,
    this.iconSize = 40,
  });

  final Widget element1;
  final Widget element2;
  final Color iconPlusColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15),
        Container(
          /* margin: EdgeInsets.symmetric(horizontal: 10), */
          child: Icon(
            FontAwesomeIcons.circlePlus,
            color: iconPlusColor,
            size: iconSize,
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
    this.iconPlusColor = Colors.white,
    this.iconSize = 40,
  });

  final Widget element1;
  final Widget element2;
  final Color iconPlusColor;
  final double iconSize;

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
            color: iconPlusColor,
            size: iconSize,
          ),
        ),
        element2,
      ],
    );
  }
}
