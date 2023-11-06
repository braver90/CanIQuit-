import 'dart:async';

import 'package:can_i_quit/features/home/domain/repositories/home_repository.dart';
import 'package:can_i_quit/shared/domain/entities/service_module.dart';

import 'application/home_cubit.dart';
import 'data/datasources/home_datasource.dart';

class HomeModule implements ServiceModule {
  final injector = ServiceModule.injector;

  @override
  FutureOr<void> registerDependecies() async {
    await registerBlocs();
    await registerRepositories();
    await registerDatasource();
    await registerThirdParties();
    await registerOthers();
  }

  FutureOr<void> registerBlocs() {
    injector.registerFactory(() => HomeCubit());
  }

  FutureOr<void> registerRepositories() {
    injector.registerLazySingleton<HomeRepository>(() => HomeRepository());
  }

  FutureOr<void> registerDatasource() {
    injector.registerLazySingleton(() => HomeDataSource());
  }

  FutureOr<void> registerThirdParties() {}

  FutureOr<void> registerOthers() {}
}
