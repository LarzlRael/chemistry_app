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
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: AlignedGridView.count(
        itemCount: elements.length,
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        itemBuilder: (context, index) {
          final element = elements[index];
          return Hero(
            tag: element.symbol,
            child: ElementCard(
              element: element,
              key: ValueKey<String>(element.symbol),
              onTap: onSelected,
            ),
          );
        },
      ),
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
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorByGroup(element.group),
              colorByGroup(element.group).withOpacity(0.6),
            ],
          ),
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
                    lineHeight: 1,
                  ),
                  SimpleText(
                    text: element.name,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    lineHeight: 1,
                  ),
                ],
              ),
            ),
            Positioned(
                top: 30,
                right: 5,
                child: element.valencias.length > 1
                    ? Wrap(
                        children: element.valencias.map((e) {
                        return Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Column(
                            children: [
                              SimpleText(
                                text: e.value.toString(),
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                lineHeight: 1,
                              ),
                              SimpleText(
                                text: e.suffix.name
                                    .snakeCaseToWords()
                                    .toCapitalize(),
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                lineHeight: 1,
                              ),
                            ],
                          ),
                        );
                      }).toList())
                    : SimpleText(
                        text: element.valencias.first.value.toString(),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      )),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SimpleText(
                  text: element.group.name.toCapitalize(),
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: SimpleText(
                text:
                    element.typeElement.name.snakeCaseToWords().toCapitalize(),
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ElementCard2 extends StatelessWidget {
  const ElementCard2({
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
          /* Degrade */
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorByGroup(element.group),
              colorByGroup(element.group).withOpacity(0.8),
            ],
          ),
        ),
        width: 200,
        height: 200,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SimpleText(
                    text: element.symbol,
                    lineHeight: 1,
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    padding: EdgeInsets.only(left: 10),
                  ),
                  SimpleText(
                    text: element.name,
                    fontSize: 35,
                    lineHeight: 1,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    padding: EdgeInsets.only(left: 10),
                  ),
                ],
              ),
            ),
            Positioned(
                top: 20,
                right: 20,
                child: Wrap(
                    children: element.valencias.map((e) {
                  return SimpleText(
                    text: "${e.value} ",
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  );
                }).toList())),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SimpleText(
                  text: element.group.name.toCapitalize(),
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
