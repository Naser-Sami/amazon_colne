import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/core/_core.dart';
import '/config/_config.dart';
import '/features/_features.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  observers: [AppNavigatorObserver()],
  navigatorKey: NavigationService.navigatorKey,
  routes: [
    GoRoute(
      name: 'Authentication',
      path: '/',
      pageBuilder: (context, state) => CupertinoPage(
        child: const AuthenticationScreen(),
      ),
      redirect: (context, state) => null,
    ),
    GoRoute(
      name: 'Admin',
      path: '/admin',
      pageBuilder: (context, state) => CupertinoPage(
        child: AdminScreen(),
      ),
      redirect: (context, state) => null,
    ),
    GoRoute(
      name: 'Main',
      path: '/home',
      pageBuilder: (context, state) => CupertinoPage(
        child: const BottomNavigationBarComponent(),
      ),
      redirect: (context, state) => null,
    ),
    GoRoute(
      name: 'Home',
      path: '/home-screen',
      pageBuilder: (context, state) => CupertinoPage(
        child: const HomeScreen(),
      ),
      redirect: (context, state) => null,
    ),
    GoRoute(
      name: 'Account ',
      path: '/account',
      pageBuilder: (context, state) => CupertinoPage(
        child: AccountScreen(),
      ),
      redirect: (context, state) => null,
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    // Get the token from the user data
    final user = context.read<AuthBloc>().user;

    // If the user is not authenticated, redirect to the login page
    if (user == null) {
      return '/';
    }

    if (user.token.isNotEmpty) {
      // Check if the user is Admin
      if (user.type == 'admin') {
        // If the user is an admin, redirect to the admin screen

        return '/admin';
      }

      // If the user is authenticated, redirect to the home screen
      return state.fullPath;
    }

    return null;
  },
  errorBuilder: (BuildContext context, GoRouterState state) =>
      ErrorPage(state.error.toString()),
);
