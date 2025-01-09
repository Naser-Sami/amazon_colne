import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/_core.dart';
import 'config/_config.dart';
import 'features/_features.dart';

final providers = [
  BlocProvider<ThemeCubit>(create: (context) => sl<ThemeCubit>()),
  BlocProvider<AuthBloc>(
    create: (context) => sl<AuthBloc>()..add(GetUserDataEvent()),
  ),
  BlocProvider<AdminBloc>(
    create: (context) => sl<AdminBloc>(),
  ),
  BlocProvider<ProductsBloc>(
    create: (context) => sl<ProductsBloc>(),
  ),
  BlocProvider<SearchBloc>(
    create: (context) => sl<SearchBloc>(),
  ),
  BlocProvider<ProductDetailsBloc>(
    create: (context) => sl<ProductDetailsBloc>(),
  ),
];
