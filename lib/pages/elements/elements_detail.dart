part of '../pages.dart';

class ElementsDetail extends StatelessWidget {
  final PeriodicTableElement periodicTableElement;
  static const routeName = '/elements_detail_page';
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
