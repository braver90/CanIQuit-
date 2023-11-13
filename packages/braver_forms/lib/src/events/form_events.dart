import 'package:braver_forms/src/models/form_control_value.dart';
import 'package:flutter/material.dart';

class FormEvent implements Notification {
  @override
  void debugFillDescription(List<String> description) {}

  @override
  void dispatch(BuildContext? target) {
    target?.dispatchNotification(this);
  }
}

class FormControllerValueChangedEvent extends FormEvent {
  final FieldControlValue control;
  FormControllerValueChangedEvent(this.control);
}

class FormSubmitEvent extends FormEvent {
  call(BuildContext context) {
    dispatch(context);
  }
}
