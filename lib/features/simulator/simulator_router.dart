import 'package:can_i_quit/features/simulator/application/simulator_cubit.dart';
import 'package:can_i_quit/features/simulator/presentation/pages/simulator_page.dart';
import 'package:can_i_quit/shared/domain/entities/service_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimulatorRouter {
  static const String simulatorUrl = "/simulator";
  static getRoutes() {
    return [
      GoRoute(
          path: simulatorUrl,
          builder: (context, state) => BlocProvider(
              create: (context) => ServiceModule.injector<SimulatorCubit>(),
              child: const SimulatorPage()))
    ];
  }
}
