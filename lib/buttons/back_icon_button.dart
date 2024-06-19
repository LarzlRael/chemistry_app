part of 'buttons.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    super.key,
    this.icon = Icons.chevron_left,
    this.size = 30,
    this.onPressed,
  });
  final IconData icon;
  final double size;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
          return;
        }
        Navigator.of(context).maybePop();
      },
      constraints: BoxConstraints(),
      icon: Icon(icon, size: size),
    );
  }
}
