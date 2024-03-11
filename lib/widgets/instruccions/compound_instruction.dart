part of '../widgets.dart';

class CompoundInstructionByType extends StatelessWidget {
  const CompoundInstructionByType({super.key, required this.typeCompound});
  final TypeCompound typeCompound;
  static const routeName = 'compound_instruction';
  @override
  Widget build(BuildContext context) {
    switch (typeCompound) {
      case TypeCompound.oxido:
        return CompoundInstruction();
      /*  case TypeCompound.perOxido:
        return CompoundInstruction();
      case TypeCompound.oxidoDoble:
        return CompoundInstruction();
      case TypeCompound.hidroxido:
        return CompoundInstruction();
      case TypeCompound.hidruro:
        return CompoundInstruction();
      case TypeCompound.anhidrido:
        return CompoundInstruction();
      case TypeCompound.acidoOxacido:
        return CompoundInstruction();
      case TypeCompound.acidoPolihidratado:
        return CompoundInstruction();
      case TypeCompound.ion:
        return CompoundInstruction(); */
      default:
        return Container();
    }
  }
}

class CompoundInstruction extends StatelessWidget {
  const CompoundInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    final exampleWithLition =
        generateOxidosByOneElement(getOneELement(allListPeriodic, 'Li'));
    return CardInstructionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Metal',
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.add),
              ),
              Text(
                'Oxigeno',
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(FontAwesomeIcons.equals),
              ),
              Text(
                'OXIDO',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                FormulaInText(
                  gap: 5,
                  compoundFormula: [
                    ValenceCompound(
                      suffix: 'M',
                      value: 3,
                      isSuperIndex: true,
                    ),
                    ValenceCompound(suffix: 'O', value: -2, isSuperIndex: true),
                  ],
                  fontSize: 40,
                  textStyle: Theme.of(context).textTheme.headline6,
                ),
                FormulaInText(
                  gap: 5,
                  compoundFormula: [
                    ValenceCompound(
                      suffix: 'M',
                      value: 2,
                    ),
                    ValenceCompound(suffix: 'O', value: 3)
                  ],
                  /* compoundFormula: 'Li2O', */
                  fontSize: 40,
                  textStyle: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          SimpleText(
            text:
                'Donde M es el metal con la valencia de 3  y O el oxigeno con -2',
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          SimpleText(
            text: 'Número de oxidacion del elemento M',
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          SimpleText(
            text: 'Número de oxidacion del oxigeno',
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          Align(
            alignment: Alignment.center,
            child: OxideDetail(
              compound: exampleWithLition[0],
            ),
          ),
        ],
      ),
    );
  }
}
