import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/config/_config.dart';

Widget errorBuilder(BuildContext context, GoRouterState state) =>
    ErrorPage(state.error.toString());
