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
        return OxideDetail(compound: compound);
      case TypeCompound.peroxido:
        return PeroxideDetail(compound: compound);
      case TypeCompound.oxido_doble:
        return OxidosDoubles(compound: compound);
      case TypeCompound.hidroxido:
        return Hidroxido(compound: compound);
      case TypeCompound.hidruro:
        return Hidruro(compound: compound);
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

class OxideDetail extends StatelessWidget {
  final Compound compound;
  const OxideDetail({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 60, fontWeight: FontWeight.w600);
    final textStyleSuffix =
        TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
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
          ),
          FormulaInText(
            compoundFormula: getValenceString(compound.formula),
            textStyle: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          SimpleText(
            text: compound.name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
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
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SimpleText(text: compound.element.symbol, style: textStyle),
              SimpleText(
                  text: compound.element.valencias[0].value.toString(),
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
            compoundFormula: getValenceString(compound.formula),
            textStyle: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          SimpleText(
            text: compound.name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          compound.element.group == Group.monovalente
              ? SimpleText(
                  text: "No se deben simplificar.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class OxidosDoubles extends StatelessWidget {
  final Compound compound;

  const OxidosDoubles({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ...generateOxidosByOneElement(compound.element).map(
            (e) => FormulaInText(
              compoundFormula: getValenceString(e.formula),
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          FormulaInText(
            compoundFormula: getValenceString(compound.formula),
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SimpleText(
            text: compound.name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class Hidroxido extends StatelessWidget {
  final Compound compound;

  const Hidroxido({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          /* Fix this show only one element by element  */
          ...generateOxidosByOneElement(compound.element).map(
            (e) => FormulaInText(
              compoundFormula: getValenceString(e.formula),
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          FormulaInText(
            compoundFormula: "H2O",
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          FormulaInText(
            compoundFormula: getValenceString(compound.formula),
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SimpleText(
            text: compound.name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class Hidruro extends StatelessWidget {
  final Compound compound;

  const Hidruro({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          /* Fix this show only one element by element  */
          ...generateOxidosByOneElement(compound.element).map(
            (e) => FormulaInText(
              compoundFormula: getValenceString(e.formula),
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          FormulaInText(
            compoundFormula: "H",
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          FormulaInText(
            compoundFormula: getValenceString(compound.formula),
            textStyle: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SimpleText(
            text: compound.name,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
