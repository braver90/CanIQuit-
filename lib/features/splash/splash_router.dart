import 'package:flutter_base_template/features/splash/application/splash_cubit.dart';
import 'package:flutter_base_template/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter_base_template/shared/domain/entities/service_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashRouter {
  static List<RouteBase> getRoutes() {
    return [
      GoRoute(
          path: "/splash",
          builder: (context, state) => BlocProvider<SplashCubit>(
              create: (context) => ServiceModule.injector<SplashCubit>(),
              child: const SplashPage()))
    ];
  }
}
