import 'package:can_i_quit/app.dart';
import 'package:can_i_quit/features/splash/splash_module.dart';
import 'package:can_i_quit/flavors.dart';
import 'package:can_i_quit/shared/shared_module.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.fromString(const String.fromEnvironment('FlavorName'));

  await SharedModule().registerDependecies();
  await SplashModule().registerDependecies();
  runApp(App());
}
