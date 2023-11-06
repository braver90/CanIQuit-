import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final String value;
  const SplashState({required this.value});

  factory SplashState.initial() => const SplashState(value: '');

  @override
  List<Object?> get props => [value];

  copyWith({String? value}) {
    return SplashState(value: value ?? this.value);
  }
}
