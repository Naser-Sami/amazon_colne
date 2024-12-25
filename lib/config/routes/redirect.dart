import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/features/_features.dart';

Future<String?> redirect(BuildContext context, GoRouterState state) async {
  // Get the token from the user data
  final user = context.read<AuthBloc>().user;

  // If the user is not authenticated, redirect to the login page
  if (user == null) {
    return '/';
  }

  // if (user.token.isNotEmpty) {
  // Check if the user is Admin
  // if (user.type == 'admin') {
  //   // If the user is an admin, redirect to the admin screen

  //   return '/admin';
  // }

  // If the user is authenticated, redirect to the home screen
  // return state.fullPath;
  // }

  return null;
}
