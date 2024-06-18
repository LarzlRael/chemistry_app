part of 'pages.dart';

class ElementsPage extends HookConsumerWidget {
  const ElementsPage({super.key});
  static const routeName = '/elements_page';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interstiatAdProviderN = ref.read(interstiatAdProvider.notifier);
    final remoteConfig = FirebaseRemoteConfigService();
    final tabController = useTabController(initialLength: Group.values.length);
    final colorScheme = Theme.of(context).colorScheme;
    final searchedText = useState('');
    final searchedElements = useState<List<PeriodicTableElement>>([]);
    /* useEffect(() {
      searchElementController.addListener(() {
        ;
      });
      return () {};
    }, []); */
    return Scaffold(
        /* appBar: AppBar(
          title: Text('Elementos'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            /* IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchElementDelegate(
                      compoundsProvider: ref.read(compoundProvider.notifier),
                      /* compoundsState: ref.watch(compoundProvider), */
                    ),
                  );
                },
              ), */
            IconButton(
              icon: Icon(FontAwesomeIcons.flask),
              tooltip: 'Ir a tabla periódica completa',
              onPressed: () {
                context.push(PeriodicTablePage.routeName);
              },
            ),
            IconButton(
              icon: Icon(FontAwesomeIcons.download),
              tooltip: 'Descargar tabla periódica',
              onPressed: () async {
                interstiatAdProviderN.addCounterIntersitialAdAndShow();
                await launchUrlFromString(remoteConfig.periodicTablePdf);
              },
            ),
          ],
        ), */
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            /* title: Text("Elementos"), */
            actions: [
              /* IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchElementDelegate(
                      compoundsProvider: ref.read(compoundProvider.notifier),
                      /* compoundsState: ref.watch(compoundProvider), */
                    ),
                  );
                },
              ), */
              /* IconButton(
                icon: Icon(FontAwesomeIcons.flask),
                tooltip: 'Ir a tabla periódica completa',
                onPressed: () {
                  context.push(PeriodicTablePage.routeName);
                },
              ),
              IconButton(
                icon: Icon(FontAwesomeIcons.download),
                tooltip: 'Descargar tabla periódica',
                onPressed: () async {
                  interstiatAdProviderN.addCounterIntersitialAdAndShow();
                  await launchUrlFromString(remoteConfig.periodicTablePdf);
                },
              ), */
            ],
            elevation: 0,
            /* automaticallyImplyLeading: false, */
            expandedHeight: 15,
            floating: true,
            snap: true,
          )
        ];
      },
      body: Column(
        children: [
          SearchBarElement(
            onChanged: (value) {
              searchedText.value = value;
              final list = allListPeriodic
                  .where((element) =>
                      element.name
                          .toLowerCase()
                          .contains(value.toLowerCase()) ||
                      element.symbol
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                  .toList();
              searchedElements.value = list;
            },
          ),
          searchedText.value.isNotEmpty
              ? SizedBox()
              : Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ButtonsTabBar(
                      controller: tabController,
                      backgroundColor: colorScheme.primary,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      buttonMargin: EdgeInsets.symmetric(horizontal: 10),
                      unselectedBackgroundColor: HexColor('#161A23'),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: Group.values
                          .map((group) => Tab(
                                text: group.name.toCapitalize() + 's',
                              ))
                          .toList()),
                ),
          Expanded(
            child: searchedText.value.isNotEmpty
                ? ElementListCards(
                    elements: searchedElements.value,
                    onSelected: ((element) => {
                          context.push(
                            ElementsDetail.routeName,
                            extra: element,
                          )
                        }))
                : TabBarView(
                    controller: tabController,
                    children: Group.values
                        .map((group) => ElementsByGroup(
                              group: group,
                            ))
                        .toList(),
                  ),
          )
        ],
      ),
    ));
  }
}

class CirclesRow extends StatelessWidget {
  const CirclesRow({
    super.key,
    required this.onTap,
  });
  final Function(Group groupSelected) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Wrap(
        spacing: 2, // Espacio entre los círculos
        children: Group.values.map((group) {
          return InkWell(
            onTap: () => onTap(group),
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 1,
                vertical: 2,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorByGroup(group),
              ),
              /* backgroundColor: colorByGroup(group), */
              child: Text(
                group.name == Group.todo.name
                    ? 'Todos'
                    : group.name.toCapitalize(),
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class SearchBarElement extends ConsumerWidget {
  final Function(String value) onChanged;
  const SearchBarElement({super.key, required this.onChanged});
  @override
  Widget build(BuildContext context, ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      child: Container(
        margin: const EdgeInsets.only(
            /* bottom: 10,
          top: 5, */
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          /* color: colorScheme.surface, */
        ),
        height: 50,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          /* onTap: () => showSearch(
            context: context,
            delegate: SearchElementDelegate(
              compoundsProvider: ref.read(compoundProvider.notifier),
            ),
          ), */
          child: TextField(
            onChanged: onChanged,
            /* onTap: () => showSearch(
              context: context,
              delegate: SearchElementDelegate(
                compoundsProvider: ref.read(compoundProvider.notifier),
              ),
            ), */
            decoration: InputDecoration(
              hintText: 'Buscar elemento',
              hintStyle: TextStyle(
                color: colorScheme.onSurface,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: colorScheme.onSurface,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class ElementsByGroup extends StatelessWidget {
  final Group group;

  const ElementsByGroup({super.key, required this.group});
  @override
  Widget build(BuildContext context) {
    final elements = filterByGroup(group);
    return ElementListCards(
      elements: elements,
      onSelected: ((element) => {
            context.push(
              ElementsDetail.routeName,
              extra: element,
            )
          }),
    );
  }
}
