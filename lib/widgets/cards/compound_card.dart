part of '../widgets.dart';

class CompoundtListCards extends StatelessWidget {
  final List<Compound> compoundsList;
  final Color color;
  final Function(Compound compound)? onSelected;
  final double cardFontSize;
  final double formulaFontSize;
  final double formulaGap;
  final double cardSize;
  const CompoundtListCards({
    required this.compoundsList,
    required this.color,
    super.key,
    this.onSelected,
    this.cardFontSize = 22,
    this.formulaFontSize = 50,
    this.formulaGap = 2.5,
    this.cardSize = 200,
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
            tag: compound.name,
            child: CompoundCard(
              color: color,
              compound: compound,
              fontSize: cardFontSize,
              formulaFontSize: formulaFontSize,
              formulaGap: formulaGap,
              onTap: onSelected,
              cardSize: cardSize,
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
  final double fontSize;
  final double formulaFontSize;
  final double formulaGap;
  final double cardSize;
  const CompoundCard({
    super.key,
    this.onTap,
    this.fontSize = 22,
    this.formulaFontSize = 40,
    required this.compound,
    required this.color,
    this.formulaGap = 2.5,
    this.cardSize = 200,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(color: Colors.white);
    final isAmonio = compound.name.contains('amonio');
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
        width: cardSize,
        height: cardSize,
        child: Stack(
          children: [
            if (compound.isSpecialCase)
              Positioned(
                top: 5,
                right: 5,
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormulaInText(
                      compoundFormula: compound.formula,
                      gap: formulaGap,
                      textStyle: textStyle,
                      fontSize:
                          isAmonio ? formulaFontSize * 0.65 : formulaFontSize,
                    ),
                    SimpleText(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 7.5,
                      ),
                      compound.name,
                      textAlign: TextAlign.center,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      lineHeight: 1,
                    ),
                  ],
                ),
              ),
            ),
            /* Align(
              alignment: Alignment.bottomCenter,
              child: SimpleText(
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 7.5,
                ),
                text: compound.name,
                textAlign: TextAlign.center,
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                color: Colors.white,
                lineHeight: 1,
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
