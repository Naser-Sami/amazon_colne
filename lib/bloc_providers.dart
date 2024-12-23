import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/_core.dart';
import 'config/_config.dart';
import 'features/_features.dart';

final providers = [
  BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
  BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(
      sl<SignUpUseCase>(),
      sl<LoginUseCase>(),
      sl<TokenIsValidUseCase>(),
      sl<GetUserDataUseCase>(),
    )..add(GetUserDataEvent()),
  ),
];
