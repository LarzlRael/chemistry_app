part of '../pages.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});
  static const routeName = '/test_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SimpleText(
                  '4',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: -math.pi / 4,
                  child: Container(
                    width: 20 + 10,
                    height: 2.5,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
