import 'package:braver_forms/src/events/form_events.dart';
import 'package:braver_forms/src/models/form_control_value.dart';
import 'package:braver_forms/src/widgets/base_form_field.dart';
import 'package:flutter/material.dart';

class BraverTextInput extends BaseFormField {
  final bool obscureText;
  // final Widget Function(BaseFormField formField) builder;
  const BraverTextInput(
      {required super.label,
      required super.formControlName,
      super.initialValue,
      super.key,
      super.onSaved,
      super.validator,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    var formController = super.getController(context);
    return TextFormField(
      onChanged: (value) {
        FormControllerValueChangedEvent(
                FieldControlValue(key: formControlName, value: value))
            .dispatch(context);
      },
      controller: formController,
      initialValue: initialValue,
      onSaved: (String? value) => onSaved?.call(),
      validator: validator,
      obscureText: obscureText,
    );
  }
}
