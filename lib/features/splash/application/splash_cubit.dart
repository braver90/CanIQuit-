import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  void init(BuildContext context) {
    int duration = Random().nextInt(3);
    Future.delayed(Duration(seconds: duration))
        .then((value) => GoRouter.of(context).go("/"));
  }
}
