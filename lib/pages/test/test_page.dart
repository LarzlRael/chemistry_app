part of '../pages.dart';

final redColor = HexColor('#FF4B3A');

class TestPage extends StatelessWidget {
  const TestPage({super.key});
  static const routeName = '/test_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/data/hamburguer_image.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    redColor.withOpacity(0.8),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.topCenter,
                  child: CardOveretedImage(),
                ),
                Spacer(),
                ButtonLogin(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.google,
                        color: redColor,
                        size: 35,
                      ),
                      SizedBox(width: 20),
                      SimpleText(
                        'Sign up with google',
                        color: redColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                ),
                ButtonLogin(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: SimpleText(
                    'Log in',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  backgroundColor: redColor,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Don\'t have an account?'),
                      TextSpan(text: '  '),
                      TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: redColor)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ) /*
             add child content here */
            ,
          ],
        ),
      ),
    );
  }
}

class CardOveretedImage extends StatelessWidget {
  const CardOveretedImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = 250.0;
    return Container(
        width: 130,
        height: height,
        /* color: redColor, */
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Image.asset(
                  'assets/data/planta.png',
                  fit: BoxFit.fill,
                  width: 100,
                  height: 150,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: height * 0.6,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: SimpleText(
                                  'Hola gente',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    super.key,
    required this.child,
    required this.backgroundColor,
    this.onPressed,
    this.margin,
  });
  final Widget child;
  final Color backgroundColor;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: MediaQuery.of(context).size.width * 0.9,
      child: FilledButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
          ),
          child: child,
          onPressed: onPressed),
    );
  }
}
