import 'package:bloc/bloc.dart';

import 'simulator_state.dart';

class SimulatorCubit extends Cubit<SimulatorState> {
  SimulatorCubit() : super(SimulatorState.initial());

  void init() {
    //do something
  }
}
