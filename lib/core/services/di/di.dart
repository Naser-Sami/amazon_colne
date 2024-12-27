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
        sl<TokenIsValidUseCase>(),
        sl<GetUserDataUseCase>(),
      ),
    );

    sl.registerFactory<AdminBloc>(
      () => AdminBloc(
        sl<AddProductUseCase>(),
        sl<GetProductsUseCase>(),
        sl<DeleteProductUseCase>(),
      ),
    );

    sl.registerFactory<ProductsBloc>(
      () => ProductsBloc(
        sl<GetAllProductsUseCase>(),
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

    sl.registerLazySingleton<AdminRemoteDataSource>(
      () => AdminRemoteDataSource(),
    );

    sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSource(),
    );

    // REPOSITORIES
    sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthRepositoryImplementation(
        sl<AuthRemoteDataSource>(),
      ),
    );

    sl.registerLazySingleton<IAdminRepository>(
      () => AdminRepositoryImpl(
        sl<AdminRemoteDataSource>(),
      ),
    );

    sl.registerLazySingleton<IProductsRepository>(
      () => ProductRepositoryImplementation(
        sl<ProductsRemoteDataSource>(),
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

    sl.registerLazySingleton<TokenIsValidUseCase>(
      () => TokenIsValidUseCase(
        repo: sl<AuthenticationRepository>(),
      ),
    );

    sl.registerLazySingleton<GetUserDataUseCase>(
      () => GetUserDataUseCase(
        repo: sl<AuthenticationRepository>(),
      ),
    );

    sl.registerLazySingleton<AddProductUseCase>(
      () => AddProductUseCase(
        sl<IAdminRepository>(),
      ),
    );

    sl.registerLazySingleton<GetProductsUseCase>(
      () => GetProductsUseCase(
        sl<IAdminRepository>(),
      ),
    );

    sl.registerLazySingleton<DeleteProductUseCase>(
      () => DeleteProductUseCase(
        sl<IAdminRepository>(),
      ),
    );
    sl.registerLazySingleton<GetAllProductsUseCase>(
      () => GetAllProductsUseCase(
        sl<IProductsRepository>(),
      ),
    );
  }
}
