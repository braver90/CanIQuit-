import 'dart:async';

import 'package:flutter_base_template/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_base_template/shared/domain/entities/service_module.dart';

import 'application/login_cubit.dart';
import 'data/datasources/login_datasource.dart';

class LoginModule implements ServiceModule {
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
    injector.registerFactory(() => LoginCubit());
  }

  FutureOr<void> registerRepositories() {
    injector.registerLazySingleton<LoginRepository>(() => LoginRepository());
  }

  FutureOr<void> registerDatasource() {
    injector.registerLazySingleton(() => LoginDataSource());
  }

  FutureOr<void> registerThirdParties() {}

  FutureOr<void> registerOthers() {}
}
