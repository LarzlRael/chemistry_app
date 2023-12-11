part of 'pages.dart';

class ElementsPage extends HookConsumerWidget {
  const ElementsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGroup = useState<Group>(Group.nullGroup);
    final elements = filterByGroup(selectedGroup.value);
    /* final compoundsProvider = context.read<CompoundsProvider>(); */
    final compoundsProvider = ref.watch(compoundProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('Elementos'),
      ),
      body: Container(
        /* margin: const EdgeInsets.symmetric(horizontal: 10), */
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100],
              ),
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () => showSearch(
                  context: context,
                  delegate: SearchElementDelegate(
                      compoundsProvider: compoundsProvider),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Buscar elemento',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SearchElementDelegate(
                            compoundsProvider: compoundsProvider,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            CirclesRow(
              onTap: (element) {
                selectedGroup.value = element;
              },
            ),
            Expanded(
              /* FIX THI */
              child: ElementListCards(
                elements: elements,
                key: ValueKey<Group>(
                  selectedGroup.value,
                ),
                onSelected: ((element) => {
                      context.push(
                        '/elements_detail_page',
                        extra: element,
                      )
                    }),
              ),
            ),
          ],
        ),
      ),
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
        spacing: 3, // Espacio entre los círculos
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
                group.name == Group.nullGroup.name
                    ? 'Todos'
                    : group.name.toCapitalize(),
                style: TextStyle(
                  fontSize: 13,
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
