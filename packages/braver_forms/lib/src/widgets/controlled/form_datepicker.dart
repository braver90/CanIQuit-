// import 'package:flutter/material.dart';
// import 'package:brochfolio/core/widgets/Form/events/form_events.dart';
// import 'package:brochfolio/core/widgets/Form/models/form_controller_value.dart';
// import 'package:brochfolio/core/widgets/Form/widgets/base_form_field.dart';
// import 'package:brochfolio/core/widgets/Form/widgets/simple/date_picker.dart';

// class FormDatePicker extends BaseFormField {
//   const FormDatePicker(
//       {required super.label,
//       required super.formControlName,
//       super.initialValue,
//       super.onSaved,
//       super.validator});

//   @override
//   Widget build(BuildContext context) {
//     var _formController = super.getController(context);
//     return DatePicker(
//       type: TextInputType.number,
//       controller: _formController,
//       label: label,
//       formControlName: formControlName,
//       initialValue: initialValue,
//       onSaved: onSaved,
//       validator: validator,
//       onChange: ((value) {
//         ControllerChangeValueEvent(FormControllerValue(
//                 formControlName: formControlName, value: value))
//             .dispatch(context);
//       }),
//     );
//   }
// }
