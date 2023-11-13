import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AutoCompleteOption<T> extends Equatable {
  final String text;
  final T? value;
  final Widget? prefix;
  final UniqueKey recordKey = UniqueKey();

  AutoCompleteOption(this.text, {this.value, this.prefix}) {
    var _val = value;
    if (value == null && _val is String) {
      // value = text as T;
    }
  }

  T? get getValue {
    return value == null && value is String ? text as T : value;
  }

  @override
  List<Object?> get props => [text, value, prefix];

  @override
  String toString() {
    return text;
  }
}

class AutoCompleteEmpty<T> extends AutoCompleteOption<T> {
  final Function()? onPress;

  AutoCompleteEmpty({required String text, this.onPress}) : super(text);
}
