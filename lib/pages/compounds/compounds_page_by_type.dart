part of '../pages.dart';

class CompoundsPageByType extends StatelessWidget {
  const CompoundsPageByType({
    super.key,
    required this.compoundType,
  });
  final String compoundType;
  @override
  Widget build(BuildContext context) {
    final list = generateOxidos(filterByGroup(Group.monovalente));
    return Scaffold(
      body: SafeArea(
        child: CompoundtListCards(
          elements: list,
          onSelected: ((element) => {
                context.push(
                  '/elements_detail_page',
                  extra: element,
                )
              }),
        ),
      ),
    );
  }
}
