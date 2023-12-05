part of '../widgets.dart';

class ElementListCards extends StatelessWidget {
  final List<PeriodicTableElement> elements;
  final Function(PeriodicTableElement element)? onSelected;
  const ElementListCards({
    super.key,
    this.onSelected,
    required this.elements,
  });
  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      itemCount: elements.length,
      crossAxisCount: 2,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      itemBuilder: (context, index) {
        final element = elements[index];
        return ElementCard(
          element: element,
          key: ValueKey<String>(element.symbol),
          onTap: onSelected,
        );
      },
    );
  }
}

class ElementCard extends StatelessWidget {
  const ElementCard({
    super.key,
    required this.element,
    this.onTap,
  });

  final PeriodicTableElement element;
  final Function(PeriodicTableElement element)? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(element);
        }
      },
      child: Container(
        key: key,
        decoration: BoxDecoration(
          color: colorByGroup(element.group),
        ),
        width: 200,
        height: 200,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleText(
                    text: element.symbol,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  SimpleText(
                    text: element.name,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: SimpleText(
                text: element.value.toString(),
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
