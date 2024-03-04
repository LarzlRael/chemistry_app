part of '../pages.dart';

class CompoundsByTypePage extends HookConsumerWidget {
  const CompoundsByTypePage({
    super.key,
    required this.compoundType,
  });
  final String compoundType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentType = useState<CompoundListElement?>(null);
    final listCompounds = useState<List<Compound>>([]);
    useEffect(() {
      switch (compoundType) {
        case 'Oxidos':
          listCompounds.value = generateOxidosByGroupsElements(metalGroup);
          break;

        case 'Peróxidos':
          listCompounds.value = generatePerOxidosByGroupsElements(
            [
              Group.monovalente,
              Group.bivalente,
            ],
          );
          break;
        case "Oxidos dobles":
          listCompounds.value = generateOxidosDoblesByGroupsElements(
            [
              /* Group.anfotero, */
              Group.bitetravalente,
              Group.bitrivalente,
            ],
          );
          break;
        case "Hidroxidos":
          listCompounds.value = generateHidroxidosByGroupsElements(metalGroup);
          break;
        case 'Hidruros':
          listCompounds.value = generateHidrurosByGroupsElements(metalGroup);
          break;
        case 'Anhidridos':
          listCompounds.value =
              generateAnhidridosByGroupsElements(noMetalGroup);
          break;
        case 'Acidos oxacidos':
          listCompounds.value =
              generateAcidosOxacidosByGroupsElements(noMetalGroup);
          break;
        case 'Acidos polihidratos':
          listCompounds.value = generateAcidosPolihidratadosByOneElement();
          break;
        case 'Iones':
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
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text('Un oxido se forma cuando un elemento '
                                  'se combina con oxígeno. '
                                  'Los óxidos son compuestos binarios '
                                  'formados por la combinación de un metal '
                                  'con el oxígeno. '
                                  'Los óxidos se pueden clasificar en dos '
                                  'grandes grupos: óxidos básicos y óxidos '
                                  'ácidos. '
                                  'Los óxidos básicos son compuestos binarios '
                                  'formados por la combinación de un metal '
                                  'con el oxígeno. '
                                  'Los óxidos ácidos son compuestos binarios '
                                  'formados por la combinación de un no metal '
                                  'con el oxígeno. '
                                  'Los óxidos básicos reaccionan con el agua '
                                  'para formar bases, '
                                  'mientras que los óxidos ácidos reaccionan '
                                  'con el agua para formar ácidos.'),
                              const SizedBox(height: 15),
                              TextButton(
                                onPressed: context.pop,
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        ),
                      ));
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
        color: Colors.indigoAccent,
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
