part of 'buttons.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key,
    this.titleButton = 'Comprobar',
    this.onPressed,
  });
  final String titleButton;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: secondaryColor,
      ),
      onPressed: onPressed ?? onPressed,
      child: SimpleText(
        padding: EdgeInsets.symmetric(vertical: 10),
        titleButton,
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}
