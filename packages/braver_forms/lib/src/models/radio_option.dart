import 'package:equatable/equatable.dart';

class RadioButtonOption<T> extends Equatable {
  late final String? label;
  final T value;
  final bool? isDefault;

  RadioButtonOption(this.value, {this.label, this.isDefault = false}) {
    var val = value;
    if (label == null && val is String) {
      label = val;
    }
  }

  @override
  List<Object?> get props => [label, value];
}
