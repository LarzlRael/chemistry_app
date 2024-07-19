part of '../pages.dart';

class PeriodicTablePage extends HookWidget {
  const PeriodicTablePage({super.key});
  static const routeName = '/periodic_table_page';
  @override
  Widget build(BuildContext context) {
    final isLoadingFile = useState(true);
    final isSearch = useState(false);
    final listPeriodicTable = useState<List<LocalPeriodicElement>>([]);
    final searchedElements = useState<List<LocalPeriodicElement>>([]);

    Future<void> parseFile() async {
      final data = await loadJsonFromAssets('assets/data/periodic_table.json');
      final converted = localPeriodicElementFromJson(data);
      listPeriodicTable.value =
          converted.sorted((a, b) => a.bloque.index.compareTo(b.bloque.index));
      searchedElements.value = listPeriodicTable.value;
    }

    useEffect(() {
      parseFile().then((value) {
        isLoadingFile.value = false;
      });
    }, []);

    return Scaffold(
      appBar: AppBar(
        leading: BackIconButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: isSearch.value
            ? TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: getTOneRandomElement(listPeriodicTable.value).name,
                  border: InputBorder.none,
                  /* hintStyle: TextStyle(color: Colors.white), */
                ),
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  final list = listPeriodicTable.value
                      .where((element) =>
                          element.nombre
                              .toLowerCase()
                              .contains(value.toLowerCase()) ||
                          element.symbol
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                      .toList();
                  searchedElements.value = list;
                },
              )
            : FadeIn(
                child: Text('Tabla Periódica'),
                duration: Duration(milliseconds: 100),
              ),
        actions: [
          IconButton(
            icon: Icon(FontAwesomeIcons.circleQuestion),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return SizedBox.expand(
                      child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black.withOpacity(0.6),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(Icons.cancel, size: 30),
                            onPressed: context.pop,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TapRegion(
                            onTapOutside: context.pop,
                            child: Image.asset(
                              'assets/data/indicator_element.png',
                              /* width: 150,
                              height: 200, */
                              /* fit: BoxFit.cover, */
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ));
                },
              );
            },
          ),
          isSearch.value
              ? TextButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    isSearch.value = false;
                    searchedElements.value = listPeriodicTable.value;
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    isSearch.value = true;
                  },
                )
        ],
      ),
      body: SafeArea(
        child: isLoadingFile.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: AlignedGridView.count(
                itemCount: searchedElements.value.length,
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                itemBuilder: (context, index) {
                  final data = searchedElements.value[index];
                  return CardPeriodicElement(
                    onTap: (symbol) {
                      context.push(
                        ElementsCompleteDetail.routeName + '/$symbol',
                      );
                    },
                    atomicNumer: data.atomicNumber.toString(),
                    atomicMass: data.atomicMass.toString(),
                    symbol: data.symbol,
                    name: data.nombre,
                    chemicalGruop:
                        data.bloque.name.snakeCaseToWords().toCapitalize(),
                    color: data.cpkHexColor.toString() == ""
                        ? '#03a9f4'
                        : data.cpkHexColor.toString(),
                  );
                },
              )),
      ),
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
    this.onTap,
  });

  final String atomicNumer;
  final String atomicMass;
  final String symbol;
  final String name;
  final String chemicalGruop;
  final String? color;
  final Function(String symbol)? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!(symbol);
        }
      },
      child: Container(
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
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SimpleText(
                      atomicNumer,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    /* AutoSizeText(
                      atomicMass,
                      style: TextStyle(fontSize: 20),
                      minFontSize: 14,
                      maxFontSize: 18,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ), */
                    SimpleText(
                      atomicMass.length > 5
                          ? atomicMass.substring(0, 5) + '...'
                          : atomicMass,
                      fontSize: atomicMass.length > 5 ? 15 : 20,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
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
      ),
    );
  }
}

/* Future<PeriodicElement> getLocationQuery() async {
  final url = 'https://pubchem.ncbi.nlm.nih.gov/rest/pug/periodictable/JSON';
  final response = await Request.sendRequest(RequestType.get, url);
  final mapLocation = periodicElementFromJson(response!.body);
  return mapLocation;
}
 */