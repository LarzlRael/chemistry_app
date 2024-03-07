import 'package:go_router/go_router.dart';
import 'package:templat_project/data/periodic_table_data.dart';
import 'package:templat_project/models/models.dart';
import '../pages/pages.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  /* refreshListenable: goRouterNotifier, */
  routes: [
    ///* Primera pantalla
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/games_page',
      builder: (_, __) => const GamesPage(),
    ),
    GoRoute(
      path: '/elements_page',
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
      path: '/compounds_page',
      builder: (_, __) => const CompoundsPage(),
      routes: [
        GoRoute(
          path: 'sales_neutras',
          builder: (_, state) {
            return SalesNeutras();
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
      builder: (_, state) {
        Compound element = state.extra as Compound;
        return CompoundDetailPage(
          compound: element,
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
  ],
);
