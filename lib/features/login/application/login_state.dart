import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String value;
  const LoginState({required this.value});

  factory LoginState.initial() => const LoginState(value: '');

  @override
  List<Object?> get props => [value];

  copyWith({String? value}) {
    return LoginState(value: value ?? this.value);
  }
}
