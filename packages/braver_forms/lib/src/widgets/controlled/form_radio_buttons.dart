// import 'package:flutter/material.dart';
// import 'package:brochfolio/core/widgets/Form/events/form_events.dart';
// import 'package:brochfolio/core/widgets/Form/models/form_controller_value.dart';
// import 'package:brochfolio/core/widgets/Form/models/radio_option.dart';
// import 'package:brochfolio/core/widgets/Form/widgets/base_form_field.dart';
// import 'package:brochfolio/core/widgets/Form/widgets/simple/radio_buttons.dart';

// class FormRadioButtons<T> extends BaseFormField {
//   final List<RadioButtonOption<T>> options;
//   final AxisDirection? direction;
//   final WrapAlignment? alignment;
//   const FormRadioButtons(
//       {required super.label,
//       required super.formControlName,
//       super.initialValue,
//       super.key,
//       super.onSaved,
//       super.validator,
//       required this.options,
//       this.direction,
//       this.alignment});

//   @override
//   Widget build(BuildContext context) {
//     var _formControlName = formControlName;
//     return RadioButtons<T>(
//       options: options,
//       alignment: alignment,
//       direction: direction,
//       onSelect: (T value) {
//         ControllerChangeValueEvent(FormControllerValue(
//                 formControlName: _formControlName, value: value))
//             .dispatch(context);
//       },
//     );
//   }
// }
