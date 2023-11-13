import 'package:can_i_quit/shared/application/app/app_cubit.dart';
import 'package:can_i_quit/shared/application/app/app_state.dart';
import 'package:can_i_quit/shared/domain/entities/service_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppWrapper extends StatefulWidget {
  final Widget? child;
  const AppWrapper({super.key, this.child});

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceModule.injector<AppCubit>(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) => Stack(children: [
          if (state.isLoading)
            const AnimatedOpacity(
              opacity: 1,
              duration: Duration(milliseconds: 300),
              child: Center(child: CircularProgressIndicator()),
            ),
          Opacity(
            opacity: state.isLoading ? 0.3 : 1,
            child: SafeArea(child: widget.child ?? const SizedBox.shrink()),
          ),
        ]),
      ),
    );
  }
}
