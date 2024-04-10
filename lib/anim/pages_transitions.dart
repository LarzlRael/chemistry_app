part of 'animations.dart';

enum TypeTransition {
  fadeIn,
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
}

CustomTransitionPage<dynamic> pageTransition({
  required Widget child,
  duration = const Duration(milliseconds: 500),
  TypeTransition type = TypeTransition.fadeIn,
}) {
  switch (type) {
    case TypeTransition.fadeIn:
      return fadeInTransition(child: child, duration: duration);
    case TypeTransition.leftToRight:
      return leftToRight(child: child, duration: duration);
    case TypeTransition.rightToLeft:
      return rightToLeft(child: child, duration: duration);
    case TypeTransition.topToBottom:
      return topToBottom(child: child, duration: duration);
    case TypeTransition.bottomToTop:
      return bottomToTop(child: child, duration: duration);
  }
}

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

CustomTransitionPage<dynamic> bottomToTop({
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
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    ),
  );
}
