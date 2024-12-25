import 'package:go_router/go_router.dart';

import '/core/_core.dart';
import '/config/_config.dart';

// GoRouter configuration
final router = GoRouter(
  routes: routes,
  redirect: redirect,
  initialLocation: '/',
  errorBuilder: errorBuilder,
  observers: [AppNavigatorObserver()],
  navigatorKey: NavigationService.navigatorKey,
);
