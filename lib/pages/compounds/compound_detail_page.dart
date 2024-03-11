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
        return OxideDetailCard(compound: compound);
      case TypeCompound.peroxido:
        return PeroxideDetail(compound: compound);
      case TypeCompound.oxido_doble:
        return OxidosDoubles(compound: compound);
      case TypeCompound.hidroxido:
        return Hidroxido(compound: compound);
      case TypeCompound.hidruro:
        return Hidruro(compound: compound);
      case TypeCompound.anhidrido:
        return AnHidrido(compound: compound);
      case TypeCompound.acido_oxacido:
        return AcidoOxacido(compound: compound);
      /* 
      case TypeCompound.acido:
        return AcidDetail(compound: compound);
      case TypeCompound.sal:
        return SaltDetail(compound: compound);
      case TypeCompound.hidracido:
        return HydrideDetail(compound: compound);
      case TypeCompound.oxoacido:
        return OxoacidDetail(compound: compound);
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

class OxideDetailCard extends HookWidget {
  final Compound compound;
  const OxideDetailCard({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: ElementCard(
              element: compound.periodicTableElement,
              size: 150,
              onTap: (element) => context.push(
                ElementsDetail.routeName,
                extra: element,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: OxideDetail(compound: compound),
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
    final textStyle = TextStyle(fontSize: 60, fontWeight: FontWeight.w600);
    final textStyleSuffix =
        TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
                text: compound.periodicTableElement.symbol, style: textStyle),
            SimpleText(
                text:
                    compound.periodicTableElement.valencias[0].value.toString(),
                style: textStyleSuffix),
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
          textStyle: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        compound.periodicTableElement.group == Group.monovalente
            ? SimpleText(
                text: "No se deben simplificar.",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              )
            : SizedBox(),
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
            compoundFormula: e.formula,
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        FormulaInText(
          compoundFormula: compound.formula,
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
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
        /* Fix this show only one element by element  */
        ...generateOxidosByOneElement(compound.periodicTableElement).map(
          (e) => FormulaInText(
            compoundFormula: e.formula,
            typeCompound: e.type,
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        FormulaInText(
          compoundFormula: [],
          /* compoundFormula: "H2O", */
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        FormulaInText(
          compoundFormula: compound.formula,
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        /*  SimpleText(
          text: compound.name,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
        ), */
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
        /* Fix this show only one element by element  */
        ...generateOxidosByOneElement(compound.periodicTableElement).map(
          (e) => FormulaInText(
            compoundFormula: e.formula,
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        FormulaInText(
          compoundFormula: [
            ValenceCompound(value: 1, suffix: "H"),
          ],
          /* compoundFormula: "H", */
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        FormulaInText(
          compoundFormula: compound.formula,
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
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
        /* Fix this show only one element by element  */
        ...generateOxidosByOneElement(compound.periodicTableElement).map(
          (e) => FormulaInText(
            compoundFormula: e.formula,
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        FormulaInText(
          /* compoundFormula: "H" ,*/
          compoundFormula: [],
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        FormulaInText(
          compoundFormula: (compound.formula),
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
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
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      children: [
        /* Fix this show only one element by element  */
        FormulaInText(
          compoundFormula: compound.compound!.formula,
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Text(compound.compound!.name),
        FormulaInText(
          /* compoundFormula: "H2O", */
          compoundFormula: [],
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Text("Agua"),
        FormulaInText(
          compoundFormula: compound.formula,
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Colors.black,
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
