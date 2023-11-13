import 'package:flutter/material.dart';

class FieldControl {
  final Type type;
  final String? initialValue;
  final TextEditingController? controller;
  FieldControl({required this.type, this.initialValue, this.controller});
}
