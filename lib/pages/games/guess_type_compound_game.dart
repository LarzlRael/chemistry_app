part of '../pages.dart';

class GuessTypeCompoundGame extends HookConsumerWidget {
  const GuessTypeCompoundGame({super.key});
  static const routeName = 'guess_type_compound';

  @override
  Widget build(BuildContext context, ref) {
    final size = MediaQuery.of(context).size;

    final isCorrect = useState(false);

    final isSelectedAux = useState<bool?>(null);
    final isBlock = useState(false);
    final selectedCardIndex = useState<int>(-1);
    final correctAnswerAmount = useState<int>(0);
    final compoundGuessGame = useState<CompoundGuessGame?>(null);
    final colorSchema = Theme.of(context).colorScheme;
    final interstiatAdProviderN = ref.read(interstitialAdProvider.notifier);

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
        correctAnswerAmount.value++;
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

    return ScaffoldBackground(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  BackIconButton(
                    icon: Icons.close,
                    size: 35,
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ProgressLinearTimer(
                      height: 15,
                      durationMilliseconds: compoundTimeMilliseconds,
                      onTimerFinish: () {
                        interstiatAdProviderN.addCounterInterstitialAdAndShow();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              gameTitle: 'Adivina el tipo de compuesto',
                              aciertos: correctAnswerAmount.value,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
                            compoundFormula:
                                compoundGuessGame.value!.correctElement.formula,
                            gap: 2.5,
                            fontSize: 45,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: colorSchema.primary,
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
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  itemCount: compoundGuessGame.value!.elements.length,
                  itemBuilder: (context, int index) {
                    final compound = compoundGuessGame.value!.elements[index];
                    return CardSelectOption(
                      index: index,
                      selectedCardIndex: selectedCardIndex.value,
                      isSelectedAux: isSelectedAux.value,
                      onTap: () {
                        if (isBlock.value) return;
                        selectedCardIndex.value = index;
                      },
                      compound: compound,

                      /* isCorrect: isCorrect.value, */
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
    );
  }
}
