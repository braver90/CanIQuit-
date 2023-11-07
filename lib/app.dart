import 'package:can_i_quit/app_router.dart';
import 'package:can_i_quit/config/theme.dart';
import 'package:can_i_quit/flavors.dart';
import 'package:can_i_quit/shared/application/app/app_cubit.dart';
import 'package:can_i_quit/shared/application/app/app_state.dart';
import 'package:can_i_quit/shared/domain/entities/service_module.dart';
import 'package:can_i_quit/shared/utils/shared_const.dart';
import 'package:custom_theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});
  final _router = AppRouter.createRouter();
  @override
  Widget build(BuildContext context) {
    return DynamicThemeBuilder(
        seedColor: AppTheme.seedColor,
        appTheme: AppTheme(),
        builder: (dynamicTheme) {
          return MaterialApp.router(
            localizationsDelegates: const [],
            title: F.title,
            debugShowCheckedModeBanner: false,
            darkTheme: dynamicTheme.darkTheme,
            theme: dynamicTheme.lightTheme,
            themeMode: dynamicTheme.themeMode,
            builder: (context, child) {
              return BlocProvider(
                create: (context) => ServiceModule.injector<AppCubit>(),
                child:
                    BlocBuilder<AppCubit, AppState>(builder: (context, state) {
                  return Stack(children: [
                    if (state.isLoading)
                      const AnimatedOpacity(
                        opacity: 1,
                        duration: Duration(milliseconds: 300),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    Opacity(
                        opacity: state.isLoading ? 0.3 : 1,
                        child: Scaffold(
                          // appBar: AppBar(
                          //     title: const Text(SharedConstants.appName)),
                          body:
                              SafeArea(child: child ?? const SizedBox.shrink()),
                        )),
                  ]);
                }),
              );
            },
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
            scaffoldMessengerKey: SharedConstants.scaffoldMessengerKey,
          );
        });
  }
}
