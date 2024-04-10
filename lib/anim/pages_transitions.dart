part of 'animations.dart';

CustomTransitionPage<dynamic> fadeInTransition({
  required Widget child,
  duration = const Duration(milliseconds: 500),
}) {
  return CustomTransitionPage(
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    child: child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

CustomTransitionPage<dynamic> leftToRight({
  required Widget child,
  duration = const Duration(milliseconds: 500),
}) {
  return CustomTransitionPage(
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    child: child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}

CustomTransitionPage<dynamic> rightToLeft({
  required Widget child,
  duration = const Duration(milliseconds: 500),
}) {
  return CustomTransitionPage(
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    child: child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}

CustomTransitionPage<dynamic> topToBottom({
  required Widget child,
  duration = const Duration(milliseconds: 500),
}) {
  return CustomTransitionPage(
    transitionDuration: duration,
    reverseTransitionDuration: duration,
    child: child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) =>
        SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}
