import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final String value;
  const HomeState({required this.value});

  factory HomeState.initial() => const HomeState(value: '');

  @override
  List<Object?> get props => [value];

  copyWith({String? value}) {
    return HomeState(value: value ?? this.value);
  }
}
