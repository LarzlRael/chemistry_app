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
          compoundWidget: Hidroxido(compound: compound),
        );
      case TypeCompound.hidruro:
        return Hidruro(compound: compound);

      case TypeCompound.anhidrido:
        return Anhidrido(compound: compound);

      case TypeCompound.acido_oxacido:
        return AcidoOxacido(compound: compound);

      case TypeCompound.acido_polihidratado:
        return AcidoOxacidoPoliHidratado(compound: compound);

      case TypeCompound.ion:
        return IonDetail(compound: compound);

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
    final isShowWithOutSimplify = useState(false);

    final textStyleAll = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return CardDetailCompound(
      extraAction: !compound.formula.first.isSimplified
          ? null
          : CardsElementsValences(
              onPressed: () {
                isShowWithOutSimplify.value = !isShowWithOutSimplify.value;
              },
              isShowWithOutSimplify: isShowWithOutSimplify.value,
            ),
      extraInfo: [
        SimpleText(
          padding: EdgeInsets.only(top: 10),
          text:
              "Donde el metal ${compound.periodicTableElement.name} tiene valencia de ${compound.formula.first.isSimplified ? '${compound.formula.last.value * 2}' : '${compound.formula.last.value}'} y el oxigeno de -2",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        ShowMessageSimply(
          isShowWithOutSimplify: compound.formula.first.isSimplified,
          isSimplify: isShowWithOutSimplify.value,
        )
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElementAndAndName(
              elementName: compound.periodicTableElement.name,
              element: FormulaInText(
                gap: 5,
                fontSize: 80,
                compoundFormula: [
                  ValenceCompound(
                    suffix: compound.periodicTableElement.symbol,
                    value: compound.periodicTableElement.valencias[0].value,
                    isSuperIndex: true,
                  ),
                ],
                textStyle: textStyleAll,
              ),
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 60,
            ),
            ElementAndAndName(
              elementName: 'Oxigeno',
              element: FormulaInText(
                gap: 5,
                fontSize: 80,
                compoundFormula: [
                  ValenceCompound(
                    value: -2,
                    suffix: "O",
                    isSuperIndex: true,
                  ),
                ],
                textStyle: textStyleAll,
              ),
            ),
          ],
        ),
        lineSeparator(),
        FormulaInText(
          gap: 5,
          fontSize: 100,
          compoundFormula: isShowWithOutSimplify.value
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
      fontSize: 80,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    final textStyleSuffix = TextStyle(
      fontSize: 50,
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
          children: [
            ElementAndAndName(
                element: FormulaInText(
                  gap: 5,
                  fontSize: 90,
                  compoundFormula: [
                    ValenceCompound(
                      suffix: compound.periodicTableElement.symbol,
                      value: compound.periodicTableElement.valencias[0].value,
                      isSuperIndex: true,
                    ),
                  ],
                  textStyle: textStyle,
                ),
                elementName: compound.periodicTableElement.name),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 60,
            ),
            ElementAndAndName(
              elementName: 'Oxigeno',
              element: Row(children: [
                SimpleText(text: "O", style: textStyle),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SimpleText(text: "-2", style: textStyleSuffix),
                    SimpleText(text: " 2", style: textStyleSuffix),
                  ],
                ),
              ]),
            )
          ],
        ),
        lineSeparator(),
        FormulaInText(
          compoundFormula: compound.formula,
          fontSize: 100,
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
      children: compound.isSpecialCase
          ? [
              Center(
                child: ElementAndAndName(
                  fontSize: 30,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  elementName: compound.periodicTableElement.name,
                  element: FormulaInText(
                    gap: 2.5,
                    compoundFormula: compound.formula,
                    fontSize: 80,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ]
          : [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ...generateOxidosByOneElement(
                              compound.periodicTableElement)
                          .map(
                        (e) => ElementAndAndName(
                          elementName: e.name.replaceAll('Oxido', 'Ox.'),
                          element: FormulaInText(
                            gap: 2.5,
                            compoundFormula: e.formula,
                            fontSize: 65,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
              lineSeparator(),
              FormulaInText(
                compoundFormula: compound.formula,
                fontSize: 70,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
      extraInfo: compound.isSpecialCase
          ? [
              SimpleText(
                text:
                    "Caso especial,solo se forma con un elemento. y su formula es de esta forma.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            ]
          : null,
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
        ElementAndAndName(
          elementName: compound.name.replaceAll('Oxido', 'Ox.'),
          element: FormulaInText(
            compoundFormula: [
              ValenceCompound(
                value: 2,
                suffix: compound.periodicTableElement.symbol,
              ),
              ValenceCompound(
                value: compound.formula.last.value,
                suffix: "O",
              ),
            ],
            typeCompound: compound.type,
            fontSize: 60,
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),

        ElementAndAndName(
          elementName: "Agua",
          element: FormulaInText(
            compoundFormula: [
              ValenceCompound(value: 2, suffix: "H"),
              ValenceCompound(value: 1, suffix: "0"),
            ],
            fontSize: 60,
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        lineSeparator(),
        FormulaInText(
          compoundFormula: compound.formula,
          fontSize: 80,
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
            ElementAndAndName(
              elementName: compound.periodicTableElement.name,
              element: FormulaInText(
                compoundFormula: [
                  ValenceCompound(
                    value: compound.formula.last.value,
                    suffix: compound.periodicTableElement.symbol,
                    isSuperIndex: true,
                  ),
                ],
                fontSize: 65,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 45,
              ),
            ),
            ElementAndAndName(
              elementName: "Hidrogeno",
              element: FormulaInText(
                fontSize: 65,
                compoundFormula: [
                  ValenceCompound(value: -1, suffix: "H", isSuperIndex: true),
                ],
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        lineSeparator(),
        FormulaInText(
          compoundFormula: compound.formula,
          fontSize: 100,
          gap: 5,
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

class Anhidrido extends HookWidget {
  final Compound compound;

  const Anhidrido({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    final isShowWithOutSimplify = useState(false);
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      extraInfo: [
        ShowMessageSimply(
          isShowWithOutSimplify: compound.formula.first.isSimplified,
          isSimplify: isShowWithOutSimplify.value,
        ),
      ],
      extraAction: !compound.formula.first.isSimplified
          ? null
          : CardsElementsValences(
              onPressed: () {
                isShowWithOutSimplify.value = !isShowWithOutSimplify.value;
              },
              isShowWithOutSimplify: isShowWithOutSimplify.value,
            ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElementAndAndName(
              elementName: compound.periodicTableElement.name,
              element: FormulaInText(
                fontSize: 85,
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
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 50,
              ),
            ),
            ElementAndAndName(
              elementName: "Oxigeno",
              element: FormulaInText(
                fontSize: 85,
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
            ),
          ],
        ),
        lineSeparator(),
        FormulaInText(
          compoundFormula: !isShowWithOutSimplify.value
              ? compound.formula
              : compound.formula
                  .map((e) => e.copyWith(value: e.value * 2))
                  .toList(),
          fontSize: 100,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class AcidoOxacido extends HookWidget {
  final Compound compound;
  const AcidoOxacido({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    final isShowWithOutSimplify = useState(false);
    final styleText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      extraAction: !compound.formula.first.isSimplified
          ? null
          : CardsElementsValences(
              onPressed: () {
                isShowWithOutSimplify.value = !isShowWithOutSimplify.value;
              },
              isShowWithOutSimplify: isShowWithOutSimplify.value,
            ),
      extraInfo: [
        ShowMessageSimply(
          isShowWithOutSimplify: compound.formula.first.isSimplified,
          isSimplify: isShowWithOutSimplify.value,
        ),
      ],
      compoundName: compound.name,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElementAndAndName(
              element: FormulaInText(
                compoundFormula: compound.compound!.formula,
                fontSize: 40,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              elementName: compound.compound!.name.replaceAll(
                anhidridoName,
                'Anh.',
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
            ElementAndAndName(
              elementName: "Agua",
              element: FormulaInText(
                compoundFormula: [
                  ValenceCompound(value: 2, suffix: "H"),
                  ValenceCompound(value: 1, suffix: "0"),
                ],
                fontSize: 40,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        lineSeparator(),
        FormulaInText(
          gap: 2.5,
          compoundFormula: isShowWithOutSimplify.value
              ? compound.formula
                  .map((e) => e.copyWith(value: e.value * 2))
                  .toList()
              : compound.formula,
          fontSize: 75,
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
            ElementAndAndName(
              element: FormulaInText(
                compoundFormula: compound.compound!.formula,
                gap: 2.5,
                fontSize: 80,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              elementName: compound.compound!.name,
            ),
          ],
        ),
        lineSeparator(),
        FormulaInText(
          gap: 2.5,
          compoundFormula: compound.formula,
          fontSize: 90,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class AcidoOxacidoPoliHidratado extends HookWidget {
  final Compound compound;
  const AcidoOxacidoPoliHidratado({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    final isShowWithOutSimplify = useState(false);

    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compoundName: compound.name,
      extraInfo: [
        ShowMessageSimply(
          isShowWithOutSimplify: compound.formula.first.isSimplified,
          isSimplify: isShowWithOutSimplify.value,
        ),
      ],
      extraAction: !compound.formula.first.isSimplified
          ? null
          : CardsElementsValences(
              onPressed: () {
                isShowWithOutSimplify.value = !isShowWithOutSimplify.value;
              },
              isShowWithOutSimplify: isShowWithOutSimplify.value,
            ),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElementAndAndName(
              padding: EdgeInsets.only(top: 10),
              element: FormulaInText(
                compoundFormula: compound.compound!.formula,
                gap: 2.5,
                fontSize: 70,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              elementName: compound.compound!.name,
            ),
            ElementAndAndName(
              padding: EdgeInsets.only(top: 10),
              element: FormulaInText(
                compoundFormula: [
                  ValenceCompound(
                    value: 2,
                    suffix:
                        "${mapMetaPiroOrtoReverse[compound.name.split(" ")[1]]}H",
                  ),
                  ValenceCompound(
                    value: 1,
                    suffix: "0",
                  ),
                ],
                gap: 2.5,
                fontSize: 70,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              elementName: 'Agua',
            ),
          ],
        ),
        lineSeparator(),
        FormulaInText(
          gap: 2.5,
          compoundFormula: isShowWithOutSimplify.value
              ? compound.formula
                  .map((e) => e.copyWith(value: e.value * 2))
                  .toList()
              : compound.formula,
          fontSize: 80,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
