part of '../pages.dart';

class CompoundDetail extends StatelessWidget {
  final Compound compound;
  const CompoundDetail({super.key, required this.compound});
  static const routeName = 'Compounddetail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      /* case TypeCompound.peroxido:
        return PeroxideDetail(compound: compound);
      case TypeCompound.hidroxido:
        return HydroxideDetail(compound: compound);
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
            compoundFormula: compound.formula,
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
