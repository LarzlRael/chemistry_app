part of '../widgets.dart';

class CardDetailCompound extends StatelessWidget {
  const CardDetailCompound({
    super.key,
    required this.children,
    required this.compoundName,
    required this.background,
  });
  final List<Widget> children;
  final String compoundName;
  final Color background;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      child: Container(
        width: size.width * 0.75,
        height: size.height * 0.45,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              background,
              background.withOpacity(0.6),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...children,
            Text(
              compoundName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
