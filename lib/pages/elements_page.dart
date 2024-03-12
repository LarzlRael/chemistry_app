part of 'pages.dart';

class ElementsPage extends HookConsumerWidget {
  const ElementsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /* final selectedGroup = useState<Group>(Group.nullGroup);
    final elements = filterByGroup(selectedGroup.value);
    final compoundsProvider = ref.watch(compoundProvider.notifier); */
    return DefaultTabController(
      length: Group.values.length,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
                isScrollable: true,
                /* Tab(icon: Icon(Icons.directions_car)), */
                tabs: Group.values
                    .map((group) => Tab(
                          text: group.name.toCapitalize() + 's',
                        ))
                    .toList()),
            title: Text('Elementos'),
          ),
          body: TabBarView(
              children: Group.values.map((group) {
            return Container(
              child: Column(
                children: [
                  SearchBarElement(),
                  Expanded(
                    child: ElementsByGroup(
                      group: group,
                    ),
                  ),
                ],
              ),
            );
          }).toList())),
    );
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
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey[200],
      ),
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () => showSearch(
          context: context,
          delegate: SearchElementDelegate(
            compoundsProvider: ref.read(compoundProvider.notifier),
            /* compoundsState: ref.watch(compoundProvider), */
          ),
        ),
        child: Row(
          /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */
          children: [
            Icon(
              Icons.search,
              color: Colors.grey[600],
            ),
            /* onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchElementDelegate(
                    compoundsNotifier: ref.read(compoundProvider.notifier),
                    compoundsState: ref.watch(compoundProvider),
                  ),
                );
              }, */

            Text(
              'Buscar elemento',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
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
