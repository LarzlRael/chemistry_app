part of '../pages.dart';

class CompoundsByTypePage extends HookConsumerWidget {
  const CompoundsByTypePage({
    super.key,
    required this.compoundType,
  });
  final TypeCompound compoundType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentType = useState<CompoundListElement?>(null);
    final listCompounds = useState<List<Compound>>([]);
    useEffect(() {
      switch (compoundType) {
        case TypeCompound.oxido:
          listCompounds.value = generateOxidosByGroupsElements(oxidoGroup);
          break;

        case TypeCompound.peroxido:
          listCompounds.value = generatePerOxidosByGroupsElements(
            peroxidoGroup,
          );
          break;
        case TypeCompound.oxido_doble:
          listCompounds.value =
              generateOxidosDoblesByGroupsElements(oxidoDobleGroup);
          break;
        case TypeCompound.hidroxido:
          listCompounds.value =
              generateHidroxidosByGroupsElements(hidroxidoGroup);
          break;
        case TypeCompound.hidruro:
          listCompounds.value = generateHidrurosByGroupsElements(hidruroGroup);
          break;
        case TypeCompound.anhidrido:
          listCompounds.value =
              generateAnhidridosByGroupsElements(anhidridoGroup);
          break;
        case TypeCompound.acido_oxacido:
          listCompounds.value =
              generateAcidosOxacidosByGroupsElements(acidoOxacidoGroup);
          break;
        case TypeCompound.acido_hidracido:
          listCompounds.value =
              generateAcidosHidracidosByGroupsElements(salesHidracidas);
          break;
        case TypeCompound.acido_polihidratado:
          listCompounds.value = generateAcidosPolihidratadosByOneElement();
          break;
        case TypeCompound.ion:
          listCompounds.value = generateIonesByGroupsElements(ionGroup);
          break;
        case TypeCompound.hidruro_no_metalico:
          listCompounds.value = hidrurosNoMetalicos();
          break;
        /*
        default:
          listCompounds.value = generateOxidosByGroupsElements(
            [
              Group.monovalente,
              Group.bivalente,
              Group.trivalente,
              Group.monoBivalente,
              Group.monotrivalente,
              Group.bitetravalente,
              Group.bitrivalente,
              Group.anfotero,
            ],
          ); */
        default:
          [];
      }
    }, []);
    useEffect(() {
      currentType.value = findCompoundCardByName(compoundType);
      return () {
        print('dispose');
      };
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text(currentType.value!.name),
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
                            typeCompound: compoundType,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchCompundByType(
                  listCompounds: listCompounds.value,
                  compoundNotifier: ref.read(compoundProvider.notifier),
                ),
              );
            },
          ),
        ],
      ),
      body: CompoundtListCards(
        color: colorByCompoundType(compoundType),
        cardFontSize: 22,
        formulaFontSize: formulaFontSize(compoundType),
        formulaGap: 3,
        cardSize: 160,
        compoundsList: listCompounds.value,
        onSelected: ((element) => {
              context.push(
                CompoundDetailPage.routeName,
                extra: element,
              )
            }),
      ),
    );
  }
}

double formulaFontSize(TypeCompound compoundType) {
  switch (compoundType) {
    case TypeCompound.oxido:
      return 60;
    case TypeCompound.peroxido:
      return 57.5;
    case TypeCompound.oxido_doble:
      return 60;
    case TypeCompound.hidroxido:
      return 40;
    case TypeCompound.hidruro:
      return 60;
    case TypeCompound.anhidrido:
      return 60;

    case TypeCompound.acido_oxacido:
      return 45;
    case TypeCompound.acido_polihidratado:
      return 45;
    case TypeCompound.ion:
      return 42.5;
    default:
      return 50;
  }
}
