part of '../widgets.dart';

class CompoundtListCards extends StatelessWidget {
  final List<PeriodicTableElement> elements;
  final Function(PeriodicTableElement element)? onSelected;
  const CompoundtListCards({
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
            child: CompoundCard(
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

class CompoundCard extends StatelessWidget {
  const CompoundCard({
    super.key,
    required this.element,
    this.onTap,
  });

  final PeriodicTableElement element;
  final Function(PeriodicTableElement element)? onTap;

  @override
  Widget build(BuildContext context) {
    final compound = separarElementos(element.symbol);
    final textStyle = TextStyle(color: Colors.white, fontSize: 75);
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
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: textStyle,
                        children: compound.map((e) {
                          if (e.contains(RegExp(r'[a-zA-Z]'))) {
                            return TextSpan(
                              text: e,
                              style: textStyle,
                            );
                          } else {
                            return WidgetSpan(
                              child: Transform.translate(
                                offset: const Offset(0.0, 4.0),
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                        }).toList(),
                      ),
                    ),
                    SimpleText(
                      text: element.name,
                      textAlign: TextAlign.center,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      lineHeight: 1,
                    ),
                  ],
                ),
              ),
            ),

            /* Container(
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
            ), */
            /* Positioned(
              top: 5,
              left: 5,
              child: SimpleText(
                text:
                    element.typeElement.name.snakeCaseToWords().toCapitalize(),
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
