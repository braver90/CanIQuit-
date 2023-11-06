import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool isLoading;
  const AppState({required this.isLoading});

  factory AppState.initial() => const AppState(isLoading: false);

  @override
  List<Object?> get props => [isLoading];

  copyWith({bool? isLoading}) {
    return AppState(isLoading: isLoading ?? this.isLoading);
  }
}
