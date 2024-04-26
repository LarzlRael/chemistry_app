part of '../widgets.dart';

class CompoundListSimple extends StatelessWidget {
  final List<Compound> compounds;
  final Function(Compound element)? onSelected;
  const CompoundListSimple({
    super.key,
    this.onSelected,
    required this.compounds,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      child: ListView.builder(
        itemCount: compounds.length,
        itemBuilder: (context, index) {
          final element = compounds[index];
          return Hero(
            tag: element.name,
            child: ListTileCompound(
              element: element,
              key: ValueKey<String>(element.name),
              onTap: onSelected,
            ),
          );
        },
      ),
    );
  }
}
