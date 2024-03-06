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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                  compoundFormula: 'M2O2',
                  fontSize: 40,
                  textStyle: Theme.of(context).textTheme.headline6,
                ),
                FormulaInText(
                  compoundFormula: 'Li2O',
                  fontSize: 40,
                  textStyle: Theme.of(context).textTheme.headline6,
                ),
                SimpleText(
                  text: 'Oxido de Litio',
                  padding: EdgeInsets.symmetric(vertical: 5),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
          SimpleText(
            text: 'Donde M es el metal y O el oxigeno',
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
        ],
      ),
    );
  }
}
