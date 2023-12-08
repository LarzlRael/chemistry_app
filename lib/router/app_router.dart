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
      path: '/',
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
      path: '/compounds_page',
      builder: (_, __) => const CompoundsPage(),
    ),
    GoRoute(
      path: '/elements_detail_page',
      builder: (_, state) {
        PeriodicTableElement element = state.extra as PeriodicTableElement;
        return ElementsDetail(
          periodicTableElement: element,
        );
      },
    ),
    GoRoute(
      path: '/compounds_by_type_page/:type_compound',
      builder: (_, state) {
        return CompoundsPageByType(
          compoundType: state.params['type_compound']!,
        );
      },
    ),
  ],
);
