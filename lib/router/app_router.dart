import 'package:go_router/go_router.dart';
import 'package:templat_project/anim/animations.dart';

import 'package:templat_project/models/models.dart';
import '../pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: HomePage.routeName,
  /* initialLocation: GamesPage.routeName + '/' + RoulleExample.routeName, */
  /* refreshListenable: goRouterNotifier, */
  routes: [
    ///* Primera pantalla
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: TestPage.routeName,
      builder: (context, state) => TestPage(),
    ),
    GoRoute(
      path: GamesPage.routeName,
      builder: (_, __) => const GamesPage(),
    ),
    GoRoute(
      path: ElementsPage.routeName,
      builder: (_, __) => const ElementsPage(),
    ),
    GoRoute(
      path: '/elements_page',
      builder: (_, __) => const ElementsPage(),
    ),

    GoRoute(
      path: '/animation_test',
      builder: (_, __) => const AnimationTest(),
    ),

    GoRoute(
      path: CompoundsPage.routeName,
      builder: (_, __) => const CompoundsPage(),
      routes: [
        GoRoute(
          path: SalesNeutras.routeName,
          builder: (_, state) {
            return SalesNeutras();
          },
        ),
        GoRoute(
          path: SalesDobles.routeName,
          builder: (_, state) {
            return SalesDobles();
          },
        ),
        GoRoute(
          path: SalesBasicas.routeName,
          builder: (_, state) {
            return SalesBasicas();
          },
        ),
        GoRoute(
          path: SalesHidracidas.routeName,
          builder: (_, state) {
            return SalesHidracidas();
          },
        ),
      ],
    ),

    GoRoute(
      path: ElementsDetail.routeName,
      builder: (_, state) {
        PeriodicTableElement element = state.extra as PeriodicTableElement;
        return ElementsDetail(
          periodicTableElement: element,
        );
      },
    ),
    GoRoute(
      path: CompoundDetailPage.routeName,
      pageBuilder: (_, state) {
        Compound element = state.extra as Compound;
        return leftToRight(
          duration: const Duration(milliseconds: 350),
          child: CompoundDetailPage(
            compound: element,
          ),
        );
      },
    ),
    GoRoute(
      path: '/compounds_by_type_page/:type_compound',
      builder: (_, state) {
        return CompoundsByTypePage(
          compoundType:
              getTypeCompoundFromString(state.params['type_compound']!),
        );
      },
    ),
    GoRoute(
      path: GamesPage.routeName,
      builder: (_, __) => const GamesPage(),
      routes: [
        GoRoute(
          path: ElementsShake.routeName,
          builder: (_, __) => const ElementsShake(),
        ),
        GoRoute(
          path: GuessPeriodicElement.routeName,
          builder: (_, __) => const GuessPeriodicElement(),
        ),
        GoRoute(
          path: GuessTypeCompoundGame.routeName,
          builder: (_, __) => const GuessTypeCompoundGame(),
        ),
        GoRoute(
          path: RoulleExample.routeName,
          builder: (_, __) => const RoulleExample(),
        ),
      ],
    ),
  ],
);
