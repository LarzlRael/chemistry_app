part of 'pages.dart';

class ElementsPage extends HookConsumerWidget {
  const ElementsPage({super.key});
  static const routeName = '/elements_page';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interstiatAdProviderN = ref.read(interstiatAdProvider.notifier);
    final remoteConfig = FirebaseRemoteConfigService();
    final tabController = useTabController(initialLength: Group.values.length);

    return ScaffoldBackground(
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
            title: Text("Elementos"),
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
            elevation: 0,
            /* automaticallyImplyLeading: false, */
            expandedHeight: 15,
            floating: true,
            snap: true,
          )
        ];
      },
      body: SafeArea(
        child: Column(
          children: [
            SearchBarElement(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ButtonsTabBar(
                  controller: tabController,
                  backgroundColor: primaryColor,
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
              child: TabBarView(
                  controller: tabController,
                  children: Group.values
                      .map((group) => ElementsByGroup(
                            group: group,
                          ))
                      .toList()),
            ),
          ],
        ),
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
  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.only(
          /* bottom: 10,
        top: 5, */
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: HexColor('#242424'),
      ),
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => showSearch(
          context: context,
          delegate: SearchElementDelegate(
            compoundsProvider: ref.read(compoundProvider.notifier),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 20, color: HexColor('#636363')),
            SizedBox(width: 10),
            SimpleText(
              'Buscar elemento',
              fontSize: 15,
              color: HexColor('#636363'),
            ),
          ],
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
