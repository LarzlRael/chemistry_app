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
      case TypeCompound.oxido_doble:
        return OxidoDobleInstruction();
      case TypeCompound.hidroxido:
        return HidroxidoInstruction();
      case TypeCompound.hidruro:
        return HidruroInstruction();
      case TypeCompound.anhidrido:
        return AnhidridoInstruction();
      case TypeCompound.acido_oxacido:
        return AcidoOxacidoInstruction();
      case TypeCompound.acido_polihidratado:
        return AcidoPolihidratosInstruction();

      case TypeCompound.ion:
        return IonInstruction();
      default:
        return CircularProgressIndicator();
    }
  }
}

class CompoundOxidosInstruction extends StatelessWidget {
  const CompoundOxidosInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    final exampleWithLition = generateOxidosByOneElement(
        getOneELementBySimbol(allListPeriodic, 'Li'));
    return CardInstructionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GroupsChips(groups: metalGroup),
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
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: oxigeno,
                    ),
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
                    ValenceCompound(
                      suffix: 'O',
                      value: -2,
                      isSuperIndex: true,
                      colorValue: oxigeno,
                      color: oxigeno,
                    ),
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
                      colorValue: oxigeno,
                    ),
                    ValenceCompound(suffix: 'O', value: 3, color: oxigeno)
                  ],
                  /* compoundFormula: 'Li2O', */
                  fontSize: 40,
                  textStyle: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          SimpleText(
            'Donde M es el metal con la valencia de 3  y O el oxigeno con -2',
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          SimpleText(
            'Número de oxidacion del elemento M',
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          SimpleText(
            'Número de oxidacion del oxigeno',
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          SimpleText(
            'Ejemplo:',
            padding: EdgeInsets.symmetric(vertical: 5),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            /* textAlign: TextAlign.center, */
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
        TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: oxigeno);
    final textStyle =
        TextStyle(fontSize: 40, fontWeight: FontWeight.w600, color: oxigeno);
    return CardInstructionContainer(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GroupsChips(
          groups: [
            Group.monovalente,
            Group.bivalente,
          ],
        ),
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
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: oxigeno),
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
                      SimpleText("O", style: textStyle),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SimpleText("-2", style: textStyleSuffix),
                          SimpleText(" 2", style: textStyleSuffix),
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
          'Donde M es el metal con la valencia de 1  y O el oxigeno con +2 y -2',
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        SimpleText(
          'Número de oxidacion del elemento M',
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        SimpleText(
          'Número de oxidacion del oxigeno',
          padding: EdgeInsets.symmetric(vertical: 5),
        ),
        exampleLabel(),
        Align(
          alignment: Alignment.center,
          child: PeroxideDetail(
            compound: generatePeroxidoByOneElement(
              getOneELementBySimbol(allListPeriodic, 'Li'),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SimpleText(
            "Los hidroxidos se forman con un oxido basico y agua",
            fontSize: 16,
            /* textAlign: TextAlign.center, */
          ),
          GroupsChips(groups: metalGroup),
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
                    'Oxido basico',
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
                        color: agua,
                      ),
                      ValenceCompound(
                        suffix: 'O',
                        value: 1,
                        color: agua,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Agua',
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
                        color: agua,
                        value: 1,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Hidroxido',
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
            ],
          ),
          exampleLabel(),
          Hidroxido(
            compound: generateHidroxidosByOneElement(
              getOneELementBySimbol(allListPeriodic, 'Na'),
            )[0],
          ),
        ],
      ),
    );
  }
}

class HidruroInstruction extends StatelessWidget {
  const HidruroInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return CardInstructionContainer(
      child: Column(
        children: [
          SimpleText(
            "Los hidruros se forman con un metal y hidrogeno",
            fontSize: 16,
            /* textAlign: TextAlign.center, */
          ),
          GroupsChips(
            groups: metalGroup,
          ),
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
                          suffix: 'M', value: 1, isSuperIndex: true),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Metal',
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
                        value: -1,
                        isSuperIndex: true,
                        color: hidrogeno,
                        colorValue: hidrogeno,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Hidrogeno',
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
                        suffix: 'H',
                        value: 1,
                        color: hidrogeno,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Hidruro',
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
            ],
          ),
          exampleLabel(),
          Hidruro(
            compound: generateHidrurosByOneElement(
              getOneELementBySimbol(allListPeriodic, 'Na'),
            )[0],
          ),
        ],
      ),
    );
  }
}

class AnhidridoInstruction extends StatelessWidget {
  const AnhidridoInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return CardInstructionContainer(
      child: Column(
        children: [
          SimpleText(
            "Los anhidridos se forman con un no metal y oxigeno",
            fontSize: 16,
            textAlign: TextAlign.center,
          ),
          GroupsChips(groups: noMetalGroup),
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
                          suffix: 'NM', value: 1, isSuperIndex: true),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'No metal',
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
                    gap: -2,
                    compoundFormula: [
                      ValenceCompound(
                        suffix: 'O',
                        value: -2,
                        isSuperIndex: true,
                        color: oxigeno,
                        colorValue: oxigeno,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Oxigeno',
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
                        suffix: 'NM',
                        value: 2,
                      ),
                      ValenceCompound(
                        suffix: 'O',
                        value: 1,
                        color: oxigeno,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Anhidrido',
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
            ],
          ),
          exampleLabel(),
          Anhidrido(
            compound: generateAnhidridosByOneElement(
              getOneELementBySimbol(allListPeriodic, 'Cl'),
            )[0],
          ),
        ],
      ),
    );
  }
}

class AcidoOxacidoInstruction extends StatelessWidget {
  const AcidoOxacidoInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return CardInstructionContainer(
      child: Column(
        children: [
          GroupsChips(
            groups: noMetalGroup,
          ),
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
                          suffix: 'NM', value: 2, colorValue: oxigeno),
                      ValenceCompound(
                        suffix: 'O',
                        value: 1,
                        isSuperIndex: false,
                        color: oxigeno,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Anhidrido',
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
                    gap: -2,
                    compoundFormula: h2O,
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Agua',
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
                        suffix: 'H',
                        value: 2,
                        color: hidrogeno,
                      ),
                      ValenceCompound(
                        suffix: 'NM',
                        value: 2,
                      ),
                      ValenceCompound(
                        suffix: 'O',
                        value: 2,
                        color: oxigeno,
                      ),
                    ],
                    fontSize: 30,
                    textStyle: Theme.of(context).textTheme.headline6,
                  ),
                  SimpleText(
                    'Ácido',
                    padding: EdgeInsets.symmetric(vertical: 5),
                  ),
                ],
              ),
            ],
          ),
          exampleLabel(),
          AcidoOxacido(
            compound: generateAcidosOxacidosByOneElement(
              getOneELementBySimbol(allListPeriodic, 'Cl'),
            )[2],
          ),
        ],
      ),
    );
  }
}

class IonInstruction extends StatelessWidget {
  const IonInstruction({super.key});

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
                  SimpleText(
                    "Para formar un Ion tienes que eliminar el hidrogeno",
                    fontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                  SimpleText(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    "Se cambia la terminacion de oso a convierte en 'ito' e ico se convierte en 'ato'",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          exampleLabel(),
          IonDetail(
            compound: generateIonesByOneElement(
              getOneELementBySimbol(allListPeriodic, 'Cl'),
            )[2],
          ),
        ],
      ),
    );
  }
}

class OxidoDobleInstruction extends StatelessWidget {
  const OxidoDobleInstruction({super.key});

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
                  SimpleText(
                    "Los oxidos dobles se forman solo con el Bitrivalentes, Bitetravalentes y anfoteros con su valencia metalica",
                    fontSize: 16,
                    textAlign: TextAlign.center,
                  ),
                  SimpleText(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    "Se deben sumar sus valencias para formar 3 y 4",
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
          exampleLabel(),
          OxidosDoubles(
            compound: generateOxidosDoblesByOneElement(
              getOneELementBySimbol(allListPeriodic, 'Sn'),
            )[0],
          ),
        ],
      ),
    );
  }
}

class AcidoPolihidratosInstruction extends StatelessWidget {
  const AcidoPolihidratosInstruction({super.key});
  @override
  Widget build(BuildContext context) {
    const namePoli = ['Meta', 'Piro', 'Orto'];
    return CardInstructionContainer(
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 15),
                  SimpleText(
                    "Se forma un acido polihidratado con un anhidrido y agua que pueden ser 1, 2 o 3 moleculas",
                    fontSize: 16,
                    textAlign: TextAlign.center,
                  ),
                  SimpleText(
                    "Para formar acidos polihidratos se usan estos elementos P, Sb, As, B, Si",
                    fontSize: 16,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  ...namePoli
                      .mapIndexed(
                        (index, e) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FormulaInText(
                              gap: 2,
                              compoundFormula: [
                                ValenceCompound(
                                  suffix: 'NM',
                                  value: 1,
                                ),
                                ValenceCompound(
                                  suffix: 'O',
                                  color: oxigeno,
                                  value: 1,
                                ),
                              ],
                              fontSize: 30,
                              textStyle: Theme.of(context).textTheme.headline6,
                            ),
                            Icon(Icons.add),
                            FormulaInText(
                              gap: 2,
                              compoundFormula: [
                                ValenceCompound(
                                  suffix: '${index + 1}H',
                                  value: 2,
                                  color: agua,
                                  colorValue: agua,
                                ),
                                ValenceCompound(
                                  suffix: '0',
                                  value: 1,
                                  color: agua,
                                ),
                              ],
                              fontSize: 30,
                              textStyle: Theme.of(context).textTheme.headline6,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              child: Icon(FontAwesomeIcons.equals, size: 14),
                            ),
                            SimpleText(
                              "Acido " + e,
                              padding: EdgeInsets.symmetric(vertical: 5),
                              fontSize: 18,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ],
              ),
            ],
          ),
          AcidoOxacidoPoliHidratado(
            compound: generateAcidosPolihidratadosByOneElement()[0],
          ),
          AcidoOxacidoPoliHidratado(
            compound: generateAcidosPolihidratadosByOneElement()[1],
          ),
          AcidoOxacidoPoliHidratado(
            compound: generateAcidosPolihidratadosByOneElement()[2],
          ),
        ],
      ),
    );
  }
}
