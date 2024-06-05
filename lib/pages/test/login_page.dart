part of '../pages.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = 'login_page';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.35,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/data/hamburguer_image.jpg',
                    width: double.infinity,
                    height: size.height * 0.35,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.35,
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: redColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: size.width * 0.075,
              top: size.height * 0.35 - 40,
              child: Container(
                width: size.width * 0.85,
                height: size.height * 0.65,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Expanded(
                          child: TabViewCustom(
                        tabsTitle: ['Login', 'Sign up'],
                        tabsContent: [
                          Container(
                              child: Column(
                            children: [
                              SimpleText(
                                'Welcome to fast food',
                                fontSize: 22.5,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                                padding: EdgeInsets.all(20),
                              ),
                              Container(
                                padding: EdgeInsets.all(20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                  ),
                                ),
                              ),
                              Spacer(),
                              ButtonLogin(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TestHomePage(),
                                    ),
                                  );
                                },
                                backgroundColor: Colors.red,
                                child: SimpleText(
                                  'Log in',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SimpleText(
                                'Forgot password?',
                                padding: EdgeInsets.symmetric(vertical: 5),
                              ),
                            ],
                          )),
                          RegisterForm(),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.only(bottom: 5);
    return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SimpleText(
              'Register to fast food',
              fontSize: 22.5,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              padding: EdgeInsets.all(20),
            ),
            Container(
              padding: padding,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            Container(
              padding: padding,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            Container(
              padding: padding,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            Spacer(),
            ButtonLogin(
              backgroundColor: Colors.red,
              child: SimpleText(
                'Register',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            SimpleText(
              'Forgot password?',
              padding: EdgeInsets.only(top: 5),
            ),
          ],
        ));
  }
}
