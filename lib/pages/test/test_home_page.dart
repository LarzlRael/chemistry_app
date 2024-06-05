part of '../pages.dart';

const headerSize = 0.25;

class TestHomePage extends StatelessWidget {
  const TestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: size.height * headerSize,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/data/hamburguer_image.jpg',
                    width: double.infinity,
                    height: size.height * headerSize,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * headerSize,
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
                  SafeArea(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: redColor,
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * headerSize - 75,
              child: Container(
                width: size.width,
                height: size.height * 0.65,
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.9,
                      child: Column(
                        children: [
                          SimpleText(
                            'What\'s for Dinner Tonight?',
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                icon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabViewCustom(
                        tabsTitle: ['Food', 'Drinks', 'Snacks', 'Sauvages'],
                        tabsContent: [
                          Container(
                            width: size.width,
                            child: PageView(
                              controller: PageController(
                                viewportFraction: 0.6,
                                initialPage: 0,
                              ),
                              scrollDirection: Axis.horizontal,
                              children: [
                                CardProduct(),
                                CardProduct(),
                                CardProduct(),
                              ],
                              /* child: Card(), */
                            ),
                          ),
                          Container(),
                          Container(),
                          Container(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardProduct extends StatelessWidget {
  const CardProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        /* boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ], */
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/data/hamburguer_image.jpg',
              width: 100,
              height: 125,
              fit: BoxFit.cover,
            ),
            SimpleText(
              'Hamburguer',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              padding: EdgeInsets.only(
                top: 25,
                bottom: 5,
              ),
            ),
            SimpleText(
              '20\$',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
