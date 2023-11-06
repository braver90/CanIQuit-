import 'package:flutter/material.dart';
import 'package:flutter_base_template/app.dart';
import 'package:flutter_base_template/features/splash/splash_module.dart';
import 'package:flutter_base_template/flavors.dart';
import 'package:flutter_base_template/shared/shared_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.fromString(const String.fromEnvironment('FlavorName'));

  await SharedModule().registerDependecies();
  await SplashModule().registerDependecies();
  runApp(App());
}
