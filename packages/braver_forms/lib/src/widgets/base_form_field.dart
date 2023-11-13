import 'package:braver_forms/src/widgets/form_group_controllers.dart';
import 'package:flutter/material.dart';

abstract class BaseFormField extends StatelessWidget {
  final String label;
  final Function? onSaved;
  final String? Function(String?)? validator;
  final String formControlName;
  final String? initialValue;

  const BaseFormField(
      {Key? key,
      required this.label,
      this.onSaved,
      this.validator,
      required this.formControlName,
      this.initialValue})
      : super(key: key);

  TextEditingController? getController(BuildContext context) {
    return FormGroupControllers.of(context)!.formGroup[formControlName];
  }
}
