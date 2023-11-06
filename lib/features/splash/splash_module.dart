import 'dart:async';

import 'package:flutter_base_template/features/splash/domain/repositories/splash_repository.dart';
import 'package:flutter_base_template/shared/domain/entities/service_module.dart';

import 'application/splash_cubit.dart';
import 'data/datasources/splash_datasource.dart';

class SplashModule implements ServiceModule {
  static final injector = ServiceModule.injector;

  @override
  FutureOr<void> registerDependecies() async {
    await registerBlocs();
    await registerRepositories();
    await registerDatasource();
    await registerThirdParties();
    await registerOthers();
  }

  FutureOr<void> registerBlocs() {
    injector.registerFactory(() => SplashCubit());
  }

  FutureOr<void> registerRepositories() {
    injector.registerLazySingleton<SplashRepository>(() => SplashRepository());
  }

  FutureOr<void> registerDatasource() {
    injector.registerLazySingleton(() => SplashDataSource());
  }

  FutureOr<void> registerThirdParties() {}

  FutureOr<void> registerOthers() {}
}
