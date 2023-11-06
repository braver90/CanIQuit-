import 'package:flutter/material.dart';
import 'package:flutter_base_template/app_router.dart';
import 'package:flutter_base_template/flavors.dart';
import 'package:flutter_base_template/shared/application/app/app_cubit.dart';
import 'package:flutter_base_template/shared/application/app/app_state.dart';
import 'package:flutter_base_template/shared/config/shared_const.dart';
import 'package:flutter_base_template/shared/domain/entities/service_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});
  final _router = AppRouter.createRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [],
      title: F.title,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return BlocBuilder<AppCubit, AppState>(
            bloc: ServiceModule.injector(),
            builder: (context, state) {
              return Stack(children: [
                if (state.isLoading)
                  const AnimatedOpacity(
                    opacity: 1,
                    duration: Duration(milliseconds: 300),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                Opacity(opacity: state.isLoading ? 0.3 : 1, child: child),
              ]);
            });
      },
      // theme: theme.light(settings.value.sourceColor),
      // darkTheme: theme.dark(settings.value.sourceColor),
      // themeMode: theme.themeMode(),
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      scaffoldMessengerKey: SharedConstants.scaffoldMessengerKey,
    );
  }
}
