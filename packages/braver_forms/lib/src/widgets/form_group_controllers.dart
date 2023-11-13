import 'package:flutter/material.dart';

class FormGroupControllers extends InheritedWidget {
  const FormGroupControllers(
      {super.key, required this.formGroup, required super.child});

  final Map<String, TextEditingController> formGroup;

  static FormGroupControllers? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FormGroupControllers>();
  }

  @override
  bool updateShouldNotify(FormGroupControllers oldWidget) {
    return oldWidget.formGroup != formGroup;
  }
}
