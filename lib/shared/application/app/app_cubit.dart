import 'package:bloc/bloc.dart';

import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());

  void init() {
    emit(state.copyWith(isLoading: true));
  }

  isLoading() {
    emit(state.copyWith(isLoading: true));
  }

  loadingDone() {
    emit(state.copyWith(isLoading: false));
  }
}
