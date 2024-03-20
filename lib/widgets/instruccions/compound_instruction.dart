part of '../widgets.dart';

class CompoundInstructionByType extends StatelessWidget {
  const CompoundInstructionByType({super.key, required this.typeCompound});
  final TypeCompound typeCompound;
  static const routeName = 'compound_instruction';
  @override
  Widget build(BuildContext context) {
    switch (typeCompound) {
      case TypeCompound.oxido:
        return CompoundOxidosInstruction();
      case TypeCompound.peroxido:
        return CompoundPeroxidosInstruction();
      case TypeCompound.hidroxido:
        return HidroxidoInstruction();
      /*  
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

class CompoundOxidosInstruction extends StatelessWidget {
  const CompoundOxidosInstruction({super.key});

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

class CompoundPeroxidosInstruction extends StatelessWidget {
  const CompoundPeroxidosInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyleSuffix =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
    final textStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.w600);
    return CardInstructionContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
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
              'Oxigeno (+2 y -2)',
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(FontAwesomeIcons.equals),
            ),
            Text(
              'PEROXIDO',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FormulaInText(
                    gap: 5,
                    compoundFormula: [
                      ValenceCompound(
                        suffix: 'M',
                        value: 1,
                        isSuperIndex: true,
                      ),
                    ],
                    fontSize: 40,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                ],
              ),
            ],
          ),
        ),
        SimpleText(
          text:
              'Donde M es el metal con la valencia de 1  y O el oxigeno con +2 y -2',
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
          child: PeroxideDetail(
            compound: generatePeroxidoByOneElement(
              getOneELement(allListPeriodic, 'Li'),
            )[0],
          ),
        ),
      ],
    ));
  }
}

class HidroxidoInstruction extends StatelessWidget {
  const HidroxidoInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return CardInstructionContainer(
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Column(
                children: [
                  FormulaInText(
                    gap: 2,
                    compoundFormula: [
                      ValenceCompound(
                        suffix: 'M',
                        value: 2,
                      ),
                      ValenceCompound(
                        suffix: 'O',
                        value: 1,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    text: 'Oxido basico',
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(Icons.add),
              ),
              Column(
                children: [
                  FormulaInText(
                    gap: 2,
                    compoundFormula: [
                      ValenceCompound(
                        suffix: 'H',
                        value: 2,
                      ),
                      ValenceCompound(
                        suffix: 'O',
                        value: 1,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    text: 'Agua',
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                child: Icon(FontAwesomeIcons.equals),
              ),
              Column(
                children: [
                  FormulaInText(
                    gap: 2,
                    compoundFormula: [
                      ValenceCompound(
                        suffix: 'M',
                        value: 1,
                      ),
                      ValenceCompound(
                        suffix: '(OH)',
                        value: 1,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    text: 'Hidroxido',
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
            ],
          ),
          Hidroxido(
            compound: generateHidroxidosByOneElement(
              getOneELement(allListPeriodic, 'Na'),
            )[0],
          ),
        ],
      ),
    );
  }
}
