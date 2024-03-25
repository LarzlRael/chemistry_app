part of '../widgets.dart';

class ElementsListTile extends StatelessWidget {
  final List<PeriodicTableElement> elements;
  final Function(PeriodicTableElement element)? onSelected;
  const ElementsListTile({
    super.key,
    this.onSelected,
    required this.elements,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          final element = elements[index];

          return Hero(
            tag: element.symbol,
            child: ListTileElement(
              element: element,
              key: ValueKey<String>(element.symbol),
              onTap: onSelected,
            ),
          );
        },
      ),
    );
  }
}

class ListTileElement extends StatelessWidget {
  const ListTileElement({
    super.key,
    required this.element,
    this.onTap,
  });

  final PeriodicTableElement element;
  final Function(PeriodicTableElement element)? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!(element);
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorByGroup(element.group),
                colorByGroup(element.group).withOpacity(0.5),
              ],
            ),
          ),
          child: ListTile(
            key: key,
            title: SimpleText(
              element.name,
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
            subtitle: Row(
              children: element.valencias
                  .map((e) => SimpleText(
                        e.value.toString(),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.white,
                      ))
                  .toList(),
            ),
            leading: CircleAvatar(child: Text(element.symbol)),
          ),
        ),
      ),
    );
  }
}
