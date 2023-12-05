part of 'pages.dart';

class ElementsPage extends HookWidget {
  static const String routeName = 'elements_page';
  const ElementsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedGroup = useState<Group?>(null);
    final elements = filterByGroup(selectedGroup.value);
    return Scaffold(
      appBar: AppBar(
        title: Text('Elementos'),
      ),
      body: Container(
        /* margin: const EdgeInsets.symmetric(horizontal: 10), */
        child: Column(
          children: [
            CirclesRow(
              onTap: (element) {
                selectedGroup.value = element;
              },
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[100],
              ),
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Expanded(
                child: AlignedGridView.count(
              itemCount: elements.length,
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              itemBuilder: (context, index) {
                final element = elements[index];
                return ElementCard(element: element);
              },
            )),
          ],
        ),
      ),
    );
  }
}

class ElementCard extends StatelessWidget {
  const ElementCard({
    super.key,
    required this.element,
  });

  final PeriodicTableElement element;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorByGroup(element.group),
      ),
      width: 200,
      height: 200,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SimpleText(
                  text: element.symbol,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                SimpleText(
                  text: element.name,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: SimpleText(
              text: element.value.toString(),
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ],
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
    return Wrap(
      spacing: 8, // Espacio entre los círculos
      children: Group.values.map((group) {
        return InkWell(
          onTap: () {
            onTap(group);
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: colorByGroup(group),
          ),
        );
      }).toList(),
    );
  }
}
