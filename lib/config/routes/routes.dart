import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  // Add your navigator observers
  observers: [AppNavigatorObserver()],
  navigatorKey: NavigationService.navigatorKey,
  // Set the navigatorKey
  errorBuilder: (context, state) => ErrorPage(state.error.toString()),
  redirect: (context, state) async {
    return null;
  },
  routes: [
    GoRoute(
      name: 'Home',
      path: '/',
      pageBuilder: (context, state) => CupertinoPage(
        child: const AuthenticationScreen(),
      ),
      redirect: (context, state) {
        return null;
      },
    ),
  ],
);
