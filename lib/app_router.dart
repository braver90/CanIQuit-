import 'package:can_i_quit/features/home/home_router.dart';
import 'package:can_i_quit/features/login/login_router.dart';
import 'package:can_i_quit/features/splash/splash_router.dart';
import 'package:can_i_quit/shared/presentation/widgets/private_area_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const root = "/";
  static createRouter() {
    return GoRouter(
        errorBuilder: (context, state) => Container(),
        initialLocation: "/splash",
        redirect: (context, state) {
          return null;
        },
        routes: [
          ..._publicRoutes(),
          ..._privateRoutes(),
        ]);
  }

  static _publicRoutes() {
    return [...SplashRouter.getRoutes(), ...LoginRouter.getRoutes()];
  }

  static _privateRoutes() {
    return [
      ShellRoute(
          builder: (context, state, child) {
            return PrivateAreaScaffold(child: child);
          },
          routes: [...HomeRouter.getRoutes()])
    ];
  }
}
