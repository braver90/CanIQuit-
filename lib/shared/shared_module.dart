import 'dart:async';

import 'package:can_i_quit/shared/application/app/app_cubit.dart';
import 'package:can_i_quit/shared/domain/entities/service_module.dart';

class SharedModule implements ServiceModule {
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
    injector.registerSingleton(AppCubit());
  }

  FutureOr<void> registerDatasource() {}

  FutureOr<void> registerOthers() {}
  FutureOr<void> registerRepositories() {}
  FutureOr<void> registerThirdParties() {}
}
