import 'package:go_router/go_router.dart';
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
  ],
);
