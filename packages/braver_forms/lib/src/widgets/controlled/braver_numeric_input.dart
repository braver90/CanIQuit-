import 'package:braver_forms/src/events/form_events.dart';
import 'package:braver_forms/src/models/form_control_value.dart';
import 'package:braver_forms/src/widgets/base_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BraverNumerInput extends BaseFormField {
  final TextInputType? inputType;
  const BraverNumerInput(
      {required super.label,
      required super.formControlName,
      super.initialValue,
      super.key,
      super.onSaved,
      super.validator,
      this.inputType});

  List<TextInputFormatter>? getInputType() {
    if (inputType == TextInputType.number) {
      return [FilteringTextInputFormatter.digitsOnly];
    }
    if (inputType ==
            const TextInputType.numberWithOptions(
                decimal: true, signed: true) ||
        inputType ==
            const TextInputType.numberWithOptions(
                decimal: true, signed: false)) {
      return [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
      ];
    } else {
      return [FilteringTextInputFormatter.digitsOnly];
    }
  }

  @override
  Widget build(BuildContext context) {
    var formController = super.getController(context);
    return TextFormField(
      inputFormatters: getInputType(),
      controller: formController,
      initialValue: initialValue,
      onSaved: (String? value) => onSaved?.call(),
      validator: validator,
      onChanged: ((value) {
        if (value != "") {
          num parsedValue = num.parse(value.replaceAll(",", "."));
          FormControllerValueChangedEvent(
                  FieldControlValue(key: formControlName, value: parsedValue))
              .dispatch(context);
        }
      }),
    );
  }
}
