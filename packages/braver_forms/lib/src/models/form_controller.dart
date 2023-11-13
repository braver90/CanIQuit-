import 'package:braver_forms/braver_form.dart';
import 'package:flutter/material.dart';

class FormController {
  GlobalKey<BraverFormState> key = GlobalKey<BraverFormState>();
  FormController();
  void submit() {
    final state = key.currentState;

    if (state != null) {
      state.submit();
    }
  }

  Stream<Map<String, dynamic>>? onChange() {
    final state = key.currentState;
    if (state != null) {
      return state.onFormChange;
    }
    return null;
  }

  void validate() {
    final state = key.currentState;

    if (state != null) {
      state.validate();
    }
  }
}
