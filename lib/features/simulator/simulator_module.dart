import 'dart:async';

import 'package:can_i_quit/features/simulator/application/simulator_cubit.dart';
import 'package:can_i_quit/features/simulator/data/datasources/simulator_datasource.dart';
import 'package:can_i_quit/features/simulator/domain/repositories/Simulator_repository.dart';
import 'package:can_i_quit/shared/domain/entities/service_module.dart';

class SimulatorModule implements ServiceModule {
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
    injector.registerFactory(() => SimulatorCubit());
  }

  FutureOr<void> registerRepositories() {
    injector.registerLazySingleton<SimulatorRepository>(
        () => SimulatorRepository());
  }

  FutureOr<void> registerDatasource() {
    injector.registerLazySingleton(() => SimulatorDataSource());
  }

  FutureOr<void> registerThirdParties() {}

  FutureOr<void> registerOthers() {}
}
