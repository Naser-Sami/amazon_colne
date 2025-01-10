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
        sl<GetDealOfDayUseCase>(),
      ),
    );

    sl.registerFactory<SearchBloc>(
      () => SearchBloc(
        sl<SearchProductsUseCase>(),
      ),
    );

    sl.registerFactory<ProductDetailsBloc>(
      () => ProductDetailsBloc(
        sl<RateProductUseCase>(),
        sl<AddToCartUseCase>(),
        sl<RemoveFromCartUseCase>(),
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

    sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSource(),
    );

    sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
      () => ProductDetailsRemoteDataSource(),
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

    sl.registerLazySingleton<ISearchProductsRepository>(
      () => SearchProductsRepositoryImplementation(
        sl<SearchRemoteDataSource>(),
      ),
    );

    sl.registerLazySingleton<IProductDetailsRepository>(
      () => ProductDetailsRepositoryImpl(
        sl<ProductDetailsRemoteDataSource>(),
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

    sl.registerLazySingleton<SearchProductsUseCase>(
      () => SearchProductsUseCase(
        sl<ISearchProductsRepository>(),
      ),
    );

    sl.registerLazySingleton<RateProductUseCase>(
      () => RateProductUseCase(
        sl<IProductDetailsRepository>(),
      ),
    );

    sl.registerLazySingleton<AddToCartUseCase>(
      () => AddToCartUseCase(
        sl<IProductDetailsRepository>(),
      ),
    );

    sl.registerLazySingleton<RemoveFromCartUseCase>(
      () => RemoveFromCartUseCase(
        sl<IProductDetailsRepository>(),
      ),
    );

    sl.registerLazySingleton<GetDealOfDayUseCase>(
      () => GetDealOfDayUseCase(
        sl<IProductsRepository>(),
      ),
    );
  }
}
