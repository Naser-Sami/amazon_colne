import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  routes: routes,
  redirect: redirect,
  errorBuilder: errorBuilder,
  observers: [AppNavigatorObserver()],
  navigatorKey: NavigationService.navigatorKey,
);

Future<String?> redirect(BuildContext context, GoRouterState state) async {
  // Get the token from the user data
  context.read<AuthBloc>().add(GetUserDataEvent());
  final user = context.read<AuthBloc>().user;

  // If the user is not authenticated, redirect to the login page
  if (user == null) {
    return '/';
  }

  if (user.token.isNotEmpty) {
    // If the user is authenticated, redirect to the home screen
    return state.fullPath;
  }

  return null;
}

Widget errorBuilder(BuildContext context, GoRouterState state) => ErrorPage(state.error.toString());

List<RouteBase> routes = [
  GoRoute(
    name: 'Authentication',
    path: '/',
    pageBuilder: (context, state) => CupertinoPage(
      child: const AuthenticationScreen(),
    ),
    redirect: (context, state) {
      return null;
    },
  ),
  GoRoute(
    name: 'Home',
    path: '/home-screen',
    pageBuilder: (context, state) => CupertinoPage(
      child: const BottomNavigationBarComponent(),
    ),
    redirect: (context, state) {
      return null;
    },
  ),
  GoRoute(
    name: 'Account',
    path: '/account',
    pageBuilder: (context, state) => CupertinoPage(
      child: AccountScreen(),
    ),
    redirect: (context, state) => null,
  ),
];
