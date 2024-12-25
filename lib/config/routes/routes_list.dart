import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '/config/_config.dart';
import '/features/_features.dart';

List<RouteBase> routes = [
  GoRoute(
    name: 'Authentication',
    path: '/',
    pageBuilder: (context, state) => CupertinoPage(
      child: const AuthenticationScreen(),
    ),
    redirect: (context, state) => null,
  ),

  // Admin routes
  GoRoute(
    name: 'Admin',
    path: '/admin',
    pageBuilder: (context, state) => CupertinoPage(
      child: AdminScreen(),
    ),
    redirect: (context, state) => null,
  ),
  GoRoute(
    name: 'AddProduct',
    path: '/add-product',
    pageBuilder: (context, state) => CupertinoPage(
      child: AddProductScreen(),
    ),
    redirect: (context, state) => null,
  ),

  // User routes
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
];
