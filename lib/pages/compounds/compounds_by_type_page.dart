part of '../pages.dart';

class CompoundsByTypePage extends HookWidget {
  const CompoundsByTypePage({
    super.key,
    required this.compoundType,
  });
  final String compoundType;
  @override
  Widget build(BuildContext context) {
    /* final list = generateOxidosByOneElement(listPeriodic[0]); */
    /* final list = generateOxidosByGroupElements(Group.monovalente); */
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
        /*
        case 'Oxidos dobles':
          listCompounds.value = generateOxidosDoblesByGroupsElements(
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

    return Scaffold(
      appBar: AppBar(
        title: Text(compoundType),
      ),
      body: CompoundtListCards(
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
