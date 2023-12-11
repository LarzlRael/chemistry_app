part of '../pages.dart';

class CompoundsByTypePage extends StatelessWidget {
  const CompoundsByTypePage({
    super.key,
    required this.compoundType,
  });
  final String compoundType;
  @override
  Widget build(BuildContext context) {
    /* final list = generateOxidosByOneElement(listPeriodic[0]); */
    final list = generateOxidosByGroupElements(Group.monovalente);
    return Scaffold(
      body: SafeArea(
        child: CompoundtListCards(
          compoundsList: list,
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
