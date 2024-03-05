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
          listCompounds.value = generateOxidosByGroupsElements(metalGroup);
          break;

        case TypeCompound.peroxido:
          listCompounds.value = generatePerOxidosByGroupsElements(
            [
              Group.monovalente,
              Group.bivalente,
            ],
          );
          break;
        case TypeCompound.oxido_doble:
          listCompounds.value = generateOxidosDoblesByGroupsElements(
            [
              /* Group.anfotero, */
              Group.bitetravalente,
              Group.bitrivalente,
            ],
          );
          break;
        case TypeCompound.hidroxido:
          listCompounds.value = generateHidroxidosByGroupsElements(metalGroup);
          break;
        case TypeCompound.hidruro:
          listCompounds.value = generateHidrurosByGroupsElements(metalGroup);
          break;
        case TypeCompound.anhidrido:
          listCompounds.value =
              generateAnhidridosByGroupsElements(noMetalGroup);
          break;
        case TypeCompound.acido_oxacido:
          listCompounds.value =
              generateAcidosOxacidosByGroupsElements(noMetalGroup);
          break;
        case TypeCompound.acido_polihidratado:
          listCompounds.value = generateAcidosPolihidratadosByOneElement();
          break;
        case TypeCompound.ion:
          listCompounds.value = generateIonesByGroupsElements(noMetalGroup);
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
                  heightFactor: 0.9,
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
        /* change this for de color */
        color: colorByCompoundType(compoundType),
        compoundsList: listCompounds.value,
        onSelected: ((element) => {
              context.push(
                '/compound_detail_page',
                extra: element,
              )
            }),
      ),
    );
  }
}
