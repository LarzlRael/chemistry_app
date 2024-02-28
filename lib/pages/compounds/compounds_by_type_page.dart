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
          );
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
          listCompounds.value = generateHidroxidosByGroupsElements(
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
          );
          break;
        case 'Hidruros':
          listCompounds.value = generateHidrurosByGroupsElements(
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
          );
          break;
        case 'Anhidridos':
          listCompounds.value = generateAnhidridosByGroupsElements(
            [
              Group.halogeno,
              Group.nitrogeniodes,
              Group.anfigenos,
              Group.carbonoides,
              Group.anfotero,
            ],
          );
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
          /* Hero(
            tag: currentType.value!.name,
            child: Image.asset(
              currentType.value!.pathImage,
              width: 25,
              height: 25,
            ),
          ) */
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchCompundByType(
                  listCompounds: listCompounds.value,
                  compoundNotifier: ref.read(compoundProvider.notifier),
                  compoundState: ref.watch(compoundProvider),
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
