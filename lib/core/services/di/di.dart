import 'package:get_it/get_it.dart';

import '/config/_config.dart';
import '/features/_features.dart';

// Global Variable
// Initialize GetIt
final sl = GetIt.I;

class DI {
  Future<void> init() async {
    // BLOC's
    sl.registerFactory<AuthBloc>(
      () => AuthBloc(
        sl<SignUpUseCase>(),
        sl<LoginUseCase>(),
      ),
    );

    // CUBIT's
    sl.registerLazySingleton<ThemeCubit>(
      () => ThemeCubit(),
    );

    // PROVIDERS

    // LOCAL STORAGE

    // DATASOURCE'S
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(),
    );

    // REPOSITORIES
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthRepositoryImplementation(
        sl<AuthRemoteDataSource>(),
      ),
    );

    // USE CASES
    sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        repo: sl<AuthenticationRepository>(),
      ),
    );

    sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(
        repo: sl<AuthenticationRepository>(),
      ),
    );
  }
}
