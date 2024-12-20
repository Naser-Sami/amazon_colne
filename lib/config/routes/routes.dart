import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
    // Check if the user is authenticated
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'x-auth-token');

    // If the user is not authenticated, redirect to the login page
    if (token == null || token.isEmpty) {
      return '/';
    }

    // Set the token in the ApiClient
    await ApiClient.setToken(token);

    return null;
  },
  routes: [
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
        child: const HomeScreen(),
      ),
      redirect: (context, state) {
        return null;
      },
    ),
  ],
);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AuthFailureState) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is AuthSuccessState) {
            return Center(
              child: Text(state.user.toString()),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
