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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(periodicTableElement.name),
      ),
      body: ScaffoldBackground(
        child: SizedBox.expand(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: periodicTableElement.symbol,
                  child: ElementCard(
                    size: size.width * 0.90,
                    fontSize: 100,
                    element: periodicTableElement,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BannerAd(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
