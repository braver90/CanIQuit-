import 'package:equatable/equatable.dart';

class SimulatorState extends Equatable {
  final String value;
  const SimulatorState({required this.value});

  factory SimulatorState.initial() => const SimulatorState(value: '');

  @override
  List<Object?> get props => [value];

  copyWith({String? value}) {
    return SimulatorState(value: value ?? this.value);
  }
}
