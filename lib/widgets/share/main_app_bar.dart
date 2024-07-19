part of '../widgets.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar(
      {super.key,
      this.actions,
      this.titlePage,
      this.center = false,
      this.titleWidget});
  final List<Widget>? actions;
  final String? titlePage;
  final bool center;
  final Widget? titleWidget;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      actions: actions,
      centerTitle: center,
      /* backgroundColor: Colors.transparent, */
      /* actions: actionsByPage[indexBottomNavbar.value], */
      elevation: 0,
      title: titleWidget ??
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  ghostLogo,
                  width: 25,
                  height: 25,
                ),
              ),
              const SizedBox(width: 10),
              SimpleText(
                titlePage ?? appName,
                fontSize: 20,
              ),
            ],
          ),
      /* centerTitle: true, */
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
