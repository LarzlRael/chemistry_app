part of '../pages.dart';

class CompoundsByTypePage extends HookWidget {
  const CompoundsByTypePage({
    super.key,
    required this.compoundType,
  });
  final String compoundType;
  @override
  Widget build(BuildContext context) {
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
              Group.anfotero,
              Group.bitetravalente,
              Group.bitrivalente,
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
          Hero(
            tag: currentType.value!.name,
            child: Image.asset(
              currentType.value!.pathImage,
              width: 25,
              height: 25,
            ),
          )
        ],
      ),
      body: CompoundtListCards(
        /* change this for de color */
        color: Colors.blue,
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
