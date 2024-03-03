part of '../widgets.dart';

class CardDetailCompound extends StatelessWidget {
  const CardDetailCompound({
    super.key,
    required this.children,
  });
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.75,
      height: size.height * 0.45,
      padding: const EdgeInsets.all(8),
      child: Card(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }
}
