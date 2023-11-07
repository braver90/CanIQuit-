import 'dart:async';

import 'package:can_i_quit/features/simulator/simulator_module.dart';
import 'package:can_i_quit/features/splash/splash_module.dart';
import 'package:can_i_quit/shared/domain/entities/service_module.dart';
import 'package:can_i_quit/shared/shared_module.dart';

class AppModule implements ServiceModule {
  @override
  FutureOr<void> registerDependecies() async {
    await SharedModule().registerDependecies();
    await SplashModule().registerDependecies();
    await SimulatorModule().registerDependecies();
  }
}
