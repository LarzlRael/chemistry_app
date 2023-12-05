part of 'pages.dart';

class ElementsPage extends HookWidget {
  static const String routeName = 'elements_page';
  const ElementsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedGroup = useState<Group>(Group.nullGroup);
    final elements = filterByGroup(selectedGroup.value);
    final compoundsProvider = context.read<CompoundsProvider>();
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
                child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: ElementListCards(
                elements: elements,
                key: ValueKey<Group>(
                  selectedGroup.value,
                ),
                onSelected: ((element) => {
                      inspect(element),
                    }),
              ),
            )),
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
            child: CircleAvatar(
              radius: 20,
              backgroundColor: colorByGroup(group),
            ),
          );
        }).toList(),
      ),
    );
  }
}
