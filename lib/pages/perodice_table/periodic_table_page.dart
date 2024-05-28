part of '../pages.dart';

class PeriodicTablePage extends HookWidget {
  const PeriodicTablePage({super.key});
  static const routeName = '/periodic_table_page';
  @override
  Widget build(BuildContext context) {
    final isLoadingFile = useState(true);
    final listPeriodiTable = useState<List<LocalPeriodicElement>>([]);

    Future<void> parseFile() async {
      final data = await loadJsonFromAssets('assets/data/periodic_table.json');
      final converted = localPeriodicElementFromJson(data);
      listPeriodiTable.value =
          converted.sorted((a, b) => a.bloque.index.compareTo(b.bloque.index));
    }

    useEffect(() {
      parseFile().then((value) {
        isLoadingFile.value = false;
      });
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla Periódica'),
      ),
      body: isLoadingFile.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: AlignedGridView.count(
              itemCount: listPeriodiTable.value.length,
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              itemBuilder: (context, index) {
                final data = listPeriodiTable.value[index];
                return CardPeriodicElement(
                  atomicNumer: data.atomicNumber.toString(),
                  atomicMass: data.atomicMass.toString(),
                  symbol: data.symbol,
                  name: data.nombre,
                  chemicalGruop:
                      data.bloque.name.snakeCaseToWords().toCapitalize(),
                  color: data.cpkHexColor.toString() == ""
                      ? '#FFFFFF'
                      : data.cpkHexColor.toString(),
                );
              },
            )),
    );
  }
}

class CardPeriodicElement extends StatelessWidget {
  const CardPeriodicElement({
    super.key,
    required this.atomicNumer,
    required this.atomicMass,
    required this.symbol,
    required this.name,
    required this.chemicalGruop,
    this.color,
  });

  final String atomicNumer;
  final String atomicMass;
  final String symbol;
  final String name;
  final String chemicalGruop;
  final String? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      /* color: HexColor(data[4]), */
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              HexColor(color ?? '#FFFFFF'),
              HexColor(color ?? '#FFFFFF').withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          /* borderRadius: BorderRadius.circular(10), */
        ),
        height: 150,
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SimpleText(
                atomicNumer,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: SimpleText(
                  atomicMass.length > 5
                      ? atomicMass.substring(0, 5) + '...'
                      : atomicMass,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
            Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SimpleText(
                      symbol,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                    AutoSizeText(
                      name,
                      style: TextStyle(fontSize: 20),
                      minFontSize: 18,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )),
            Align(
                alignment: Alignment.bottomCenter,
                /* child: SimpleText(
                  chemicalGruop,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ), */
                child: AutoSizeText(
                  chemicalGruop,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  minFontSize: 13,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}

Future<PeriodicElement> getLocationQuery() async {
  final url = 'https://pubchem.ncbi.nlm.nih.gov/rest/pug/periodictable/JSON';
  final response = await Request.sendRequest(RequestType.get, url);
  final mapLocation = periodicElementFromJson(response!.body);
  return mapLocation;
}
