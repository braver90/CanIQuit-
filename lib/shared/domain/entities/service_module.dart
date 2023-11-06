import 'dart:async';

import 'package:get_it/get_it.dart';

abstract class ServiceModule {
  ServiceModule();
  static GetIt injector = GetIt.asNewInstance();

  FutureOr<void> registerDependecies() async {}
}
