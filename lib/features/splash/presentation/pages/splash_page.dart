import 'package:flutter/material.dart';
import 'package:flutter_base_template/features/splash/application/splash_cubit.dart';
import 'package:flutter_base_template/features/splash/application/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashCubit _splashCubit;
  @override
  void initState() {
    _splashCubit = context.read<SplashCubit>();
    _splashCubit.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
        bloc: _splashCubit,
        builder: (context, state) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
