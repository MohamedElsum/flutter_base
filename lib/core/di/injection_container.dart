import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_base/core/network/api_client.dart';
import 'package:flutter_base/core/network/network_info.dart';
import 'package:flutter_base/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:flutter_base/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_base/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_base/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_base/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_base/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_base/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_base/core/theme/cubit/theme_cubit.dart';
import 'package:flutter_base/core/localization/cubit/locale_cubit.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Core
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => NetworkInfo(sl()));

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );

  // Use Cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));

  // Cubits
  sl.registerFactory(() => AuthCubit(
        loginUseCase: sl(),
        logoutUseCase: sl(),
      ));
  sl.registerLazySingleton(() => ThemeCubit());
  sl.registerLazySingleton(() => LocaleCubit());
}
