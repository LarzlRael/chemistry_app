part of '../pages.dart';

class GuessTypeCompoundGame extends HookWidget {
  const GuessTypeCompoundGame({super.key});
  static const routeName = 'guess_type_compound';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final isCorrect = useState(false);

    final isSelectedAux = useState<bool?>(null);
    final isBlock = useState(false);
    final selectedCardIndex = useState<int>(-1);
    final compoundGuessGame = useState<CompoundGuessGame?>(null);

    List<Compound> compoundsByType() {
      List<Compound> listCompounds = [];
      listCompounds
          .add(getTRandomElement(generateOxidosByGroupsElements(oxidoGroup)));

      /* case TypeCompound.peroxido: */
      listCompounds.add(
          getTRandomElement(generatePerOxidosByGroupsElements(peroxidoGroup)));

      /* case TypeCompound.oxido_doble: */
      listCompounds.add(getTRandomElement(
          generateOxidosDoblesByGroupsElements(oxidoDobleGroup)));

      /* case TypeCompound.hidroxido: */
      listCompounds.add(getTRandomElement(
          generateHidroxidosByGroupsElements(hidroxidoGroup)));

      /* case TypeCompound.hidruro: */
      final oneHidruro =
          getTRandomElement(generateHidrurosByGroupsElements(hidruroGroup));
      listCompounds.add(oneHidruro);

      /* case TypeCompound.anhidrido: */
      listCompounds.add(getTRandomElement(
          generateAnhidridosByGroupsElements(anhidridoGroup)));

      /* case TypeCompound.acido_oxacido: */
      listCompounds.add(getTRandomElement(
          generateAcidosOxacidosByGroupsElements(acidoOxacidoGroup)));

      /* case TypeCompound.acido_hidracido: */
      listCompounds.add(getTRandomElement(
          generateAcidosHidracidosByGroupsElements(salesHidracidas)));

      /* case TypeCompound.acido_polihidratado: */
      listCompounds
          .add(getTRandomElement(generateAcidosPolihidratadosByOneElement()));

      /* case TypeCompound.ion: */
      final oneIon = getTRandomElement(generateIonesByGroupsElements(ionGroup));
      listCompounds.add(oneIon);

      /* case TypeCompound.hidruro_no_metalico: */
      listCompounds.add(getTRandomElement(hidrurosNoMetalicos()));
      /* sales neutras */
      /* listCompounds.add(getTRandomElement(hidrurosNoMetalicos())); */
      final firstMetal = getTRandomElement(generateMetals(metalGroup));
      final secondMetal = getTRandomElement(generateMetals(metalGroup));

      listCompounds.add(generateSalNeutra(
        firstMetal,
        getTRandomElement(firstMetal.valencias),
        oneIon,
      ));

      listCompounds.add(generateSalDoble(
              firstMetal,
              secondMetal,
              getTRandomElement(firstMetal.valencias),
              getTRandomElement(secondMetal.valencias),
              oneIon)
          .compoundResult);
      listCompounds.add(generateSalBasica(oneHidruro, oneIon));
      final firstMetalSalHidracida =
          getTRandomElement(filterByGroups(salesHidracidas));
      listCompounds.add(generateSalHidracida(
        firstMetalSalHidracida,
        secondMetal,
        getTRandomElement(firstMetalSalHidracida.valencias),
        getTRandomElement(secondMetal.valencias),
      ));
      listCompounds.add(generateSalBasica(oneHidruro, oneIon));

      return listCompounds;
    }

    useEffect(() {
      if (isCorrect.value) {
        isBlock.value = true;
        isSelectedAux.value = true;
        Future.delayed(Duration(milliseconds: 1500), () {
          isSelectedAux.value = null;
          isBlock.value = false;
          compoundGuessGame.value = generateCompoundTypeGame(compoundsByType());
          selectedCardIndex.value = -1;
          isCorrect.value = false;
        });

        /* isCorrect.value = false; */
      }
    }, [isCorrect.value]);

    useEffect(() {
      compoundGuessGame.value = generateCompoundTypeGame(compoundsByType());
    }, []);

    return Scaffold(
      body: ScaffoldBackground(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ProgresLinearTimer(
                  height: 15,
                  durationMiliseconds: 100000,
                  onTimerFinish: () {
                    GlobalSnackBar.showSnackBar(
                      context,
                      'Se acabo el tiempo',
                      backgroundColor: Colors.red,
                    );
                  },
                ),
                /* Text('Selecciona el elemento correcto'), */
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Card(
                    /* color: colorByGroup(optionsGame.value.correctAnswer.group), */
                    child: Container(
                      width: size.width * 0.90,
                      height: size.height * 0.22,
                      /* padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ), */
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SimpleText(
                              "Cual es tipo de compuesto de:",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            FormulaInText(
                              compoundFormula: compoundGuessGame
                                  .value!.correctElement.formula,
                              gap: 2.5,
                              fontSize: 50,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                            if (isSelectedAux.value != null &&
                                isSelectedAux.value!)
                              SimpleText(
                                compoundGuessGame.value!.correctElement.name,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: AlignedGridView.count(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    itemCount: compoundGuessGame.value!.elements.length,
                    itemBuilder: (context, int index) {
                      final compound = compoundGuessGame.value!.elements[index];
                      return InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onTap: () {
                          if (isBlock.value) return;
                          selectedCardIndex.value = index;
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedCardIndex.value == index
                                  ? selectedCardIndex.value == index &&
                                          isSelectedAux.value != null
                                      ? isSelectedAux.value!
                                          ? Colors.green
                                          : Colors.red
                                      : primaryColor
                                  : Colors.white,
                            ),
                            padding: EdgeInsets.all(2.5),
                            width: 100,
                            height: 60,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: SimpleText(
                                    compound.type.name,
                                    fontSize: 15,
                                    /* fontWeight: FontWeight.w500, */
                                    textAlign: TextAlign.center,
                                    color: selectedCardIndex.value == index
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                Positioned(
                                  right: 2.5,
                                  top: 2.5,
                                  child: Visibility(
                                    visible: selectedCardIndex.value == index &&
                                        isSelectedAux.value != null,
                                    child: FadeIn(
                                      duration: Duration(milliseconds: 250),
                                      child: isSelectedAux.value != null
                                          ? Icon(
                                              isSelectedAux.value!
                                                  ? Icons.check_circle
                                                  : Icons.cancel,
                                              size: 30,
                                            )
                                          : Container(
                                              child: Text("por defecto")),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: double.infinity,
                  child: VerifyButton(
                    onPressed: selectedCardIndex.value != -1 && !isBlock.value
                        ? () {
                            if (isBlock.value) return;

                            if (compoundGuessGame.value!
                                    .elements[selectedCardIndex.value].name ==
                                compoundGuessGame.value!.correctElement.name) {
                              isCorrect.value = true;
                              return;
                            }
                            isSelectedAux.value = false;
                            isBlock.value = true;
                            Future.delayed(Duration(milliseconds: 1500), () {
                              isSelectedAux.value = null;
                              isBlock.value = false;
                              selectedCardIndex.value = -1;
                            });
                          }
                        : null,
                  ),
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
