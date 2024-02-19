part of '../pages.dart';

class ElementsDetail extends StatelessWidget {
  final PeriodicTableElement periodicTableElement;

  const ElementsDetail({
    super.key,
    required this.periodicTableElement,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: periodicTableElement.symbol,
          child: ElementCard(
            element: periodicTableElement,
          ),
        ),
      ),
    );
  }
}
