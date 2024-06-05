part of '../pages.dart';

class CompoundDetailPage extends StatelessWidget {
  final Compound compound;
  const CompoundDetailPage({super.key, required this.compound});
  static const routeName = '/compound_detail_page';
  @override
  Widget build(BuildContext context) {
    return ScaffoldBackground(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(compound.name),
        actions: [
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () {
              showModalBottomSheet<String>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) => FractionallySizedBox(
                  /* heightFactor: 0.9, */
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Contenido del diálogo aquí
                          Center(
                              child: CompoundInstructionByType(
                            typeCompound: compound.type,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SizedBox.expand(
        child: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CompoundByType(
                  compound: compound,
                ),
              ),
              /* Align(alignment: Alignment.bottomCenter, child: BannerAd()), */
            ],
          ),
        ),
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
        return ElementDetailCardWithPeriodicElement(
          periodicTableElement: compound.periodicTableElement,
          compoundWidget: Hidruro(compound: compound),
        );

      case TypeCompound.anhidrido:
        return ElementDetailCardWithPeriodicElement(
          periodicTableElement: compound.periodicTableElement,
          compoundWidget: Anhidrido(
            compound: compound,
          ),
        );

      case TypeCompound.acido_oxacido:
        return ElementDetailCardWithPeriodicElement(
          compoundWidget: AcidoOxacido(compound: compound),
          periodicTableElement: compound.periodicTableElement,
        );

      case TypeCompound.acido_polihidratado:
        return ElementDetailCardWithPeriodicElement(
          compoundWidget: AcidoOxacidoPoliHidratado(compound: compound),
          periodicTableElement: compound.periodicTableElement,
        );

      case TypeCompound.ion:
        return ElementDetailCardWithPeriodicElement(
          periodicTableElement: compound.periodicTableElement,
          compoundWidget: IonDetail(compound: compound),
        );

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
    final textStyleAll = TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );

    return CardDetailCompound(
      height: 0.50,
      extraInfo: [
        /* SimpleText(
          padding: EdgeInsets.only(top: 10),
          "Donde el metal ${compound.periodicTableElement.name} tiene valencia de ${compound.formula.first.isSimplified ? '${compound.formula.last.value * 2}' : '${compound.formula.last.value}'} y el oxigeno de -2",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ), */
        /*  ShowMessageSimply(
          isShowWithOutSimplify: compound.formula.first.isSimplified,
          isSimplify: isShowWithOutSimplify.value,
        ) */
      ],
      background: colorByCompoundType(compound.type),
      compound: compound,
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
        Plus2Elements(
          direction: Plus2ElementsDirection.horizontal,
          element1: ElementAndAndName(
            elementName: compound.periodicTableElement.name,
            element: FormulaInText(
              gap: 5,
              fontSize:
                  compound.periodicTableElement.symbol.length < 3 ? 80 : 60,
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
          element2: ElementAndAndName(
            elementName: 'Oxigeno',
            element: FormulaInText(
              gap: 5,
              fontSize: 80,
              compoundFormula: [
                ValenceCompound(
                  value: -2,
                  suffix: "O",
                  isSuperIndex: true,
                  color: oxigeno,
                  colorValue: oxigeno,
                ),
              ],
              textStyle: textStyleAll,
            ),
          ),
        ),
        lineSeparator(),
        /* FormulaInText(
          gap: 1,
          fontSize: 90,
          compoundFormula: isShowWithOutSimplify.value
              ? compound.formula
                  .map((e) => e.copyWith(
                        value: e.value * 2,
                      ))
                  .toList()
              : compound.formula,
          textStyle: textStyleAll,
        ), */
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
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: () =>
            context.push(ElementsDetail.routeName, extra: periodicTableElement),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: compoundWidget,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorByGroup(periodicTableElement.group),
                        colorByGroup(periodicTableElement.group)
                            .withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        periodicTableElement.symbol,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        periodicTableElement.name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          /* color: Colors.white, */
                        ),
                      ),
                      Row(
                        children: periodicTableElement.valencias
                            .map(
                              (e) => Text(
                                e.value.toString() + " ",
                                style: TextStyle(
                                  /* color: Colors.white, */
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ),
                /* color: Colors.white, */
              ),
            ),
          ],
        ),
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
      height: 0.5,
      extraInfo: [
        compound.periodicTableElement.group == Group.monovalente
            ? SimpleText(
                "No se deben simplificar.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            : SizedBox(),
      ],
      background: colorByCompoundType(compound.type),
      compound: compound,
      children: [
        Plus2Elements(
          direction: Plus2ElementsDirection.horizontal,
          element1: ElementAndAndName(
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
          element2: ElementAndAndName(
            elementName: 'Oxigeno',
            element: Row(children: [
              SimpleText("O", style: textStyle.copyWith(color: oxigeno)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SimpleText("-2",
                      style: textStyleSuffix.copyWith(color: oxigeno)),
                  SimpleText(" 2",
                      style: textStyleSuffix.copyWith(color: oxigeno)),
                ],
              ),
            ]),
          ),
        ),
        lineSeparator(),
        /* FormulaInText(
          compoundFormula: compound.formula,
          fontSize: 100,
          gap: 2.5,
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ), */
      ],
    );
  }
}

class OxidosDoubles extends StatelessWidget {
  final Compound compound;

  const OxidosDoubles({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    final getOxides = generateOxidosByOneElement(compound.periodicTableElement)
        .mapIndexed((index, e) =>
            e.periodicTableElement.group == Group.bitetravalente && index == 0
                ? e.copyWith(
                    formula: e.formula
                        .mapIndexed((index, e) =>
                            index == 0 ? e.copyWith(suffix: '2' + e.suffix) : e)
                        .toList())
                : e)
        .toList();
    return CardDetailCompound(
      background: colorByCompoundType(compound.type),
      compound: compound,
      formulaSize: 80,
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
                    fontSize: 75,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ]
          : [
              Plus2Elements(
                element1: ElementAndAndName(
                  elementName: getOxides[0]
                      .name
                      .replaceAll(TypeCompound.oxido.name, 'Ox.'),
                  element: FormulaInText(
                    gap: 2.5,
                    compoundFormula: getOxides[0].formula,
                    fontSize: 75,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                element2: ElementAndAndName(
                  elementName: getOxides[1]
                      .name
                      .replaceAll(TypeCompound.oxido.name, 'Ox.'),
                  element: FormulaInText(
                    gap: 2.5,
                    compoundFormula: getOxides[1].formula,
                    fontSize: 75,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              lineSeparator(),
            ],
      extraInfo: compound.isSpecialCase
          ? [
              SimpleText(
                "Caso especial,solo se forma con un elemento. y su formula es de esta forma.",
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.white,
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
      formulaSize: 70,
      background: colorByCompoundType(compound.type),
      compound: compound,
      height: 0.55,
      children: [
        //*  Fix this show only one element by element
        Plus2Elements(
          element1: ElementAndAndName(
            elementName: compound.name.replaceAll(
                TypeCompound.hidroxido.name, TypeCompound.oxido.name),
            element: FormulaInText(
              compoundFormula: simplify([
                ValenceCompound(
                  value: 2,
                  suffix: compound.periodicTableElement.symbol,
                ),
                ValenceCompound(
                  value: compound.formula.last.value,
                  suffix: "O",
                  color: oxigeno,
                ),
              ]),
              typeCompound: compound.type,
              fontSize: 60,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          element2: ElementAndAndName(
            elementName: "Agua",
            element: FormulaInText(
              compoundFormula: h2O,
              fontSize: 60,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        lineSeparator(),
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
      height: 0.45,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      formulaSize: 100,
      background: colorByCompoundType(compound.type),
      compound: compound,
      children: [
        Plus2Elements(
          direction: Plus2ElementsDirection.horizontal,
          element1: ElementAndAndName(
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
          element2: ElementAndAndName(
            elementName: "Hidrogeno",
            element: FormulaInText(
              fontSize: 65,
              compoundFormula: [
                ValenceCompound(
                  value: -1,
                  suffix: "H",
                  isSuperIndex: true,
                  color: hidrogeno,
                  colorValue: hidrogeno,
                ),
              ],
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(),
      ],
    );
  }
}

class Anhidrido extends StatelessWidget {
  final Compound compound;

  const Anhidrido({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    return CardDetailCompound(
      height: 0.5,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      background: colorByCompoundType(compound.type),
      compound: compound,
      children: [
        Plus2Elements(
          direction: Plus2ElementsDirection.horizontal,
          element1: ElementAndAndName(
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
          element2: ElementAndAndName(
            elementName: "Oxigeno",
            element: FormulaInText(
              fontSize: 85,
              compoundFormula: [
                ValenceCompound(
                  value: -2,
                  colorValue: oxigeno,
                  suffix: "O",
                  isSuperIndex: true,
                  color: oxigeno,
                ),
              ],
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                /* color: Colors.white, */
              ),
            ),
          ),
        ),
        SizedBox(),
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
      formulaSize: 80,
      height: 0.60,
      mainAxisAlignment: MainAxisAlignment.start,
      background: colorByCompoundType(compound.type),
      compound: compound,
      children: [
        Container(
          child: Center(
            child: Plus2Elements(
              element1: ElementAndAndName(
                element: FormulaInText(
                  compoundFormula: compound.compound!.formula,
                  fontSize: 70,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                elementName: compound.compound!.name.replaceAll(
                  anhidridoName,
                  'Anh.',
                ),
              ),
              element2: ElementAndAndName(
                elementName: "Agua",
                element: FormulaInText(
                  compoundFormula: h2O,
                  fontSize: 70,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        /* lineSeparator(), */
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
      height: 0.45,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      background: colorByCompoundType(compound.type),
      compound: compound,
      formulaSize: 80,
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
        /* lineSeparator(), */
      ],
    );
  }
}

class AcidoOxacidoPoliHidratado extends StatelessWidget {
  final Compound compound;
  const AcidoOxacidoPoliHidratado({super.key, required this.compound});
  @override
  Widget build(BuildContext context) {
    return CardDetailCompound(
      height: 0.60,
      formulaSize: 80,
      background: colorByCompoundType(compound.type),
      compound: compound,
      children: [
        Plus2Elements(
          iconSize: 30,
          element1: ElementAndAndName(
            padding: EdgeInsets.only(top: 0),
            element: FormulaInText(
              compoundFormula: compound.compound!.formula,
              gap: 2.5,
              fontSize: 65,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            elementName: compound.compound!.name,
          ),
          element2: ElementAndAndName(
            padding: EdgeInsets.only(top: 0),
            element: FormulaInText(
              compoundFormula: [
                ValenceCompound(
                  value: 2,
                  suffix:
                      "${mapMetaPiroOrtoReverse[compound.name.split(" ")[1]]}H",
                  color: agua,
                  colorValue: agua,
                ),
                ValenceCompound(
                  value: 1,
                  suffix: "0",
                  color: agua,
                ),
              ],
              gap: 2.5,
              fontSize: 65,
              textStyle: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            elementName: 'Agua',
          ),
        )
        /* lineSeparator(), */
      ],
    );
  }
}
