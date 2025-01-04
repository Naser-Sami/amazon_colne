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
  GoRoute(
    name: 'Category Deals',
    path: '/category_deals',
    pageBuilder: (context, state) {
      final category = state.extra as String;

      return CupertinoPage(
        child: CategoryDealsScreen(
          category: category,
        ),
      );
    },
  ),
  GoRoute(
    name: 'Search',
    path: '/search-screen',
    pageBuilder: (context, state) {
      final searchQuery = state.extra as String;

      return CupertinoPage(
        child: SearchScreen(
          searchQuery: searchQuery,
        ),
      );
    },
  ),
  GoRoute(
    name: 'Product Details',
    path: ProductDetailScreen.routeName,
    pageBuilder: (context, state) {
      final product = state.extra as ProductEntities;

      return CupertinoPage(
        child: ProductDetailScreen(
          product: product,
        ),
      );
    },
  ),
];
