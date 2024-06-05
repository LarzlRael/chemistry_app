part of '../pages.dart';

class TabViewCustom extends StatefulWidget {
  final List<String> tabsTitle;
  final List<Widget> tabsContent;

  const TabViewCustom({
    super.key,
    required this.tabsTitle,
    required this.tabsContent,
  });
  @override
  TabViewCustomState createState() => TabViewCustomState();
}

class TabViewCustomState extends State<TabViewCustom>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: widget.tabsTitle.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // give the tab bar a height [can change hheight to preferred height]
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(
              25.0,
            ),
          ),
          child: TabBar(
              controller: _tabController,
              // give the indicator a decoration (color and border radius)
              indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  )),
                  color: Colors.red),
              labelColor: Colors.white,
              isScrollable: true,
              unselectedLabelColor: Colors.black,
              tabs: widget.tabsTitle
                  .map(
                    (e) => Tab(
                      text: e,
                    ),
                  )
                  .toList()),
        ),
        // tab bar view here
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: widget.tabsContent,
          ),
        ),
      ],
    );
  }
}
