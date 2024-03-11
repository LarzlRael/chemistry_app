part of '../pages.dart';

class CompoundDetailPage extends StatelessWidget {
  final Compound compound;
  const CompoundDetailPage({super.key, required this.compound});
  static const routeName = '/compound_detail_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(compound.name),
      ),
      body: Center(
        child: CompoundByType(compound: compound),
      ),
    );
  }
}

class CompoundByType extends StatelessWidget {
  final Compound compound;
  CompoundByType({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    switch (compound.type) {
      case TypeCompound.oxido:
        return ElementDetailCardWithPeriodicElement(
          compoundWidget: OxideDetail(compound: compound),
          periodicTableElement: compound.periodicTableElement,
        );
      case TypeCompound.peroxido:
        return ElementDetailCardWithPeriodicElement(
          compoundWidget: PeroxideDetail(compound: compound),
          periodicTableElement: compound.periodicTableElement,
        );
      case TypeCompound.oxido_doble:
        return ElementDetailCardWithPeriodicElement(
          compoundWidget: OxidosDoubles(compound: compound),
          periodicTableElement: compound.periodicTableElement,
        );
      case TypeCompound.hidroxido:
        return ElementDetailCardWithPeriodicElement(
          periodicTableElement: compound.periodicTableElement,
          compoundWidget: Hidroxido(
            compound: compound,
          ),
        );
      case TypeCompound.hidruro:
        return Hidruro(compound: compound);
      case TypeCompound.anhidrido:
        return AnHidrido(compound: compound);
      case TypeCompound.acido_oxacido:
        return AcidoOxacido(compound: compound);
      case TypeCompound.ion:
        return IonDetail(compound: compound);

      /* 
      case TypeCompound.acido:
        return AcidDetail(compound: compound);
      */
      default:
        return Container();
    }
  }
}

class OxideDetail extends HookWidget {
  final Compound compound;
  const OxideDetail({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    final showWithOutSimplify = useState(false);

    final textStyleAll = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return CardDetailCompound(
      extraAction: !compound.formula.first.isSimplified
          ? null
          : IconButton(
              onPressed: () {
                showWithOutSimplify.value = !showWithOutSimplify.value;
              },
              tooltip: !showWithOutSimplify.value
                  ? "Mostrar formula sin simplificar"
                  : "Mostrar formula simplificada",
              icon: Icon(
                color: Colors.white,
                size: 25,
                showWithOutSimplify.value
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove_red_eye,
              ),
            ),
      extraInfo: [
        SimpleText(
          padding: EdgeInsets.only(top: 10),
          text:
              "Donde el metal ${compound.periodicTableElement.name} tiene valencia de ${compound.formula.first.isSimplified ? '${compound.formula.last.value * 2}' : '${compound.formula.last.value}'} y el oxigeno de -2",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        if (compound.formula.first.isSimplified)
          SimpleText(
            padding: EdgeInsets.only(top: 10),
            text: "La formula se simplifico",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
      ],
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        /* Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(text: compound.element.symbol, style: textStyle),
            SimpleText(
                text: compound.element.valencias[0].value.toString(),
                style: textStyleSuffix),
            SimpleText(text: "O", style: textStyle),
            SimpleText(text: "-2", style: textStyleSuffix),
          ],
        ), */
        FormulaInText(
          gap: 5,
          fontSize: 35,
          compoundFormula: [
            ValenceCompound(
              suffix: compound.periodicTableElement.symbol,
              value: compound.periodicTableElement.valencias[0].value,
              isSuperIndex: true,
            ),
            ValenceCompound(
              value: -2,
              suffix: "O",
              isSuperIndex: true,
            ),
          ],
          textStyle: textStyleAll,
        ),
        FormulaInText(
          gap: 5,
          fontSize: 35,
          compoundFormula: showWithOutSimplify.value
              ? compound.formula
                  .map((e) => e.copyWith(
                        value: e.value * 2,
                      ))
                  .toList()
              : compound.formula,
          textStyle: textStyleAll,
        ),
      ],
    );
  }
}

class ElementDetailCardWithPeriodicElement extends HookWidget {
  final PeriodicTableElement periodicTableElement;
  const ElementDetailCardWithPeriodicElement({
    super.key,
    required this.periodicTableElement,
    required this.compoundWidget,
  });
  final Widget compoundWidget;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: ElementCard(
              element: periodicTableElement,
              size: 150,
              onTap: (element) => context.push(
                ElementsDetail.routeName,
                extra: element,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: compoundWidget,
          ),
        ],
      ),
    );
  }
}

class PeroxideDetail extends StatelessWidget {
  final Compound compound;

  const PeroxideDetail({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    final textStyleSuffix = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return CardDetailCompound(
      extraInfo: [
        compound.periodicTableElement.group == Group.monovalente
            ? SimpleText(
                text: "No se deben simplificar.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            : SizedBox(),
      ],
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          /*
          crossAxisAlignment: CrossAxisAlignment.start, */
          children: [
            SimpleText(
                text: compound.periodicTableElement.symbol, style: textStyle),
            SimpleText(
              text: compound.periodicTableElement.valencias[0].value.toString(),
              style: textStyleSuffix,
            ),
            SimpleText(text: "O", style: textStyle),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SimpleText(text: "-2", style: textStyleSuffix),
                SimpleText(text: " 2", style: textStyleSuffix),
              ],
            ),
          ],
        ),
        FormulaInText(
          compoundFormula: compound.formula,
          fontSize: 45,
          gap: 2.5,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class OxidosDoubles extends StatelessWidget {
  final Compound compound;

  const OxidosDoubles({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        ...generateOxidosByOneElement(compound.periodicTableElement).map(
          (e) => FormulaInText(
            gap: 2.5,
            compoundFormula: e.formula,
            fontSize: 30,
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        lineSeparator(),
        FormulaInText(
          compoundFormula: compound.formula,
          fontSize: 30,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class Hidroxido extends StatelessWidget {
  final Compound compound;

  const Hidroxido({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        //*  Fix this show only one element by element
        ...generateOxidosByOneElement(compound.periodicTableElement).map(
          (e) => FormulaInText(
            compoundFormula: e.formula,
            typeCompound: e.type,
            fontSize: 40,
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        FormulaInText(
          compoundFormula: [
            ValenceCompound(value: 2, suffix: "H"),
            ValenceCompound(value: 1, suffix: "0"),
          ],
          /* compoundFormula: "H2O", */
          fontSize: 40,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        lineSeparator(),
        FormulaInText(
          compoundFormula: compound.formula,
          fontSize: 30,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class Hidruro extends StatelessWidget {
  final Compound compound;

  const Hidruro({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormulaInText(
              compoundFormula: [
                ValenceCompound(
                  value: compound.periodicTableElement.valencias.first.value,
                  suffix: compound.periodicTableElement.symbol,
                ),
              ],
              fontSize: 40,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            FormulaInText(
              fontSize: 40,
              compoundFormula: [
                ValenceCompound(value: -1, suffix: "H", isSuperIndex: true),
              ],
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        lineSeparator(),
        FormulaInText(
          compoundFormula: compound.formula,
          fontSize: 40,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        /* SimpleText(
          text: compound.name,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ), */
      ],
    );
  }
}

class AnHidrido extends StatelessWidget {
  final Compound compound;

  const AnHidrido({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormulaInText(
              fontSize: 40,
              compoundFormula: [
                ValenceCompound(
                  value: compound.formula.last.value,
                  suffix: compound.periodicTableElement.symbol,
                  isSuperIndex: true,
                ),
              ],
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            FormulaInText(
              fontSize: 40,
              compoundFormula: [
                ValenceCompound(
                  value: -2,
                  suffix: "O",
                  isSuperIndex: true,
                ),
              ],
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        FormulaInText(
          compoundFormula: (compound.formula),
          fontSize: 30,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class AcidoOxacido extends StatelessWidget {
  final Compound compound;
  const AcidoOxacido({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    final styleText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                FormulaInText(
                  compoundFormula: compound.compound!.formula,
                  fontSize: 30,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SimpleText(
                  text: compound.compound!.name.replaceAll(
                    anhidridoName,
                    'Anh.',
                  ),
                  style: styleText,
                  padding: EdgeInsets.only(top: 5),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
            Column(
              children: [
                FormulaInText(
                  compoundFormula: [
                    ValenceCompound(value: 2, suffix: "H"),
                    ValenceCompound(value: 1, suffix: "0"),
                  ],
                  fontSize: 30,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SimpleText(
                  text: "Agua",
                  style: styleText,
                  padding: EdgeInsets.only(top: 5),
                ),
              ],
            )
          ],
        ),
        lineSeparator(),
        FormulaInText(
          gap: 2.5,
          compoundFormula: compound.formula,
          fontSize: 35,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class IonDetail extends StatelessWidget {
  final Compound compound;
  const IonDetail({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    final styleText = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                FormulaInText(
                  compoundFormula: compound.compound!.formula,
                  gap: 2.5,
                  fontSize: 40,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SimpleText(
                  text: compound.compound!.name,
                  style: styleText,
                  padding: EdgeInsets.only(top: 5),
                ),
              ],
            ),
          ],
        ),
        lineSeparator(),
        FormulaInText(
          gap: 2.5,
          compoundFormula: compound.formula,
          fontSize: 35,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
