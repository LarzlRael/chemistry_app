part of '../widgets.dart';

const fontSizeCard = 50.0;

class CompoundtListCards extends StatelessWidget {
  final List<Compound> compoundsList;
  final Color color;
  final Function(Compound compound)? onSelected;
  const CompoundtListCards({
    required this.compoundsList,
    required this.color,
    super.key,
    this.onSelected,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: AlignedGridView.count(
        itemCount: compoundsList.length,
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        itemBuilder: (context, index) {
          final compound = compoundsList[index];
          return Hero(
            tag: compound.formula,
            child: CompoundCard(
              color: color,
              compound: compound,
              key: ValueKey<String>(compound.formula),
              onTap: onSelected,
            ),
          );
        },
      ),
    );
  }
}

class CompoundCard extends StatelessWidget {
  final Compound compound;
  final Function(Compound element)? onTap;
  final Color color;
  const CompoundCard({
    super.key,
    this.onTap,
    required this.compound,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white, fontSize: fontSizeCard);
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(compound);
        }
      },
      child: Container(
        key: key,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              color.withOpacity(0.6),
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
                    FormulaInText(
                      compoundFormula: compound.formula,
                      textStyle: textStyle,
                    ),
                    SimpleText(
                      text: compound.name,
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
