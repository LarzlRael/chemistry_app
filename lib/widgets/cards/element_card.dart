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
    this.size = 200,
    this.fontSize = 55,
  });
  final double? size;
  final double fontSize;
  final PeriodicTableElement element;
  final Function(PeriodicTableElement element)? onTap;

  @override
  Widget build(BuildContext context) {
    final isBothTypes = hasBothTypes(element.valencias);
    final metalValencias = element.valencias
        .where((element) => element.typeElement == TypeElement.metal)
        .toList();
    final noMetalValencias = element.valencias
        .where((element) => element.typeElement == TypeElement.no_metal)
        .toList();

    return Material(
      child: InkWell(
        onTap: () {
          if (onTap != null && !isBothTypes) {
            onTap!(element);
          }
        },
        child: !isBothTypes
            ? CardElement(
                element: element,
                valencias: element.valencias,
                size: size,
                fontSize: fontSize,
                group: element.group.name.toCapitalize())
            : FlipCard(
                key: key,
                front: CardElement(
                  fontSize: fontSize,
                  size: size,
                  element: element,
                  valencias: metalValencias,
                  group: "Metal",
                  extraWidget: Icon(
                    Icons.change_circle_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                back: CardElement(
                  fontSize: fontSize,
                  size: size,
                  color: Colors.purple,
                  element: element,
                  valencias: noMetalValencias,
                  group: "No metal",
                  extraWidget: Icon(
                    Icons.change_circle_outlined,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
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

class CardElement extends StatelessWidget {
  final List<Valencia> valencias;
  final PeriodicTableElement element;
  final String group;
  final Widget? extraWidget;
  final Color? color;
  final double? size;
  final double fontSize;
  const CardElement({
    super.key,
    required this.element,
    required this.valencias,
    required this.group,
    this.extraWidget,
    this.color,
    this.size = 200,
    this.fontSize = 55,
  });

  @override
  Widget build(BuildContext context) {
/* fontSize: 55,
fontSize: 30,
fontSize: 12,
fontSize: 20,
fontSize: 16,
fontSize: 16,
fontSize: 16, */
    return Container(
      /* key: key, */
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color ?? colorByGroup(element.group),
            color != null
                ? color!.withOpacity(0.6)
                : colorByGroup(element.group).withOpacity(0.6),
          ],
        ),
      ),
      width: size,
      height: size,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SimpleText(
                    text: element.symbol,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    lineHeight: 1,
                  ),
                  SimpleText(
                    text: element.name,
                    fontSize: fontSize * 0.55,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    lineHeight: 1,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            right: 5,
            child: valencias.length > 1
                ? Wrap(
                    children: valencias.map((e) {
                    return Container(
                      margin: EdgeInsets.only(left: 5),
                      child: Column(
                        children: [
                          SimpleText(
                            text: e.value.toString(),
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: fontSize * 0.3,
                            lineHeight: 1,
                          ),
                          SimpleText(
                            text:
                                e.suffix.name.snakeCaseToWords().toCapitalize(),
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: fontSize * 0.25,
                            lineHeight: 1,
                          ),
                        ],
                      ),
                    );
                  }).toList())
                : SimpleText(
                    text: valencias.first.value.toString(),
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize * 0.4,
                  ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SimpleText(
                text: element.group.name.toCapitalize(),
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: fontSize * 0.3,
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
            child: SimpleText(
              text: group,
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: fontSize * 0.3,
            ),
          ),
          extraWidget != null
              ? Positioned(
                  right: 5,
                  top: 5,
                  child: extraWidget!,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
