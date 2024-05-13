part of '../widgets.dart';

class ScaffoldBackground extends StatelessWidget {
  const ScaffoldBackground({
    super.key,
    required this.body,
    this.appBar,
  });
  final Widget body;

  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: SizedBox.expand(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/fondo.png'),
                    fit: BoxFit.cover,
                  ),
                  /* gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1A237E),
                    Color(0xff283593),
                    Color(0xff303F9F),
                    Color(0xff3949AB),
                  ],
                ), */
                ),
              ),
              body,
            ],
          ),
        ));
  }
}
