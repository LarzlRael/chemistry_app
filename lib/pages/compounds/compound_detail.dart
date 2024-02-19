part of '../pages.dart';

class CompoundDetail extends StatelessWidget {
  final Compound compound;
  const CompoundDetail({super.key, required this.compound});
  static const routeName = 'Compounddetail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CompoundDetail'),
      ),
    );
  }
}
