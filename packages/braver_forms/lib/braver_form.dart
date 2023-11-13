import 'dart:async';
import 'dart:developer';

import 'package:braver_forms/src/events/form_events.dart';
import 'package:braver_forms/src/models/field_control.model.dart';
import 'package:braver_forms/src/models/form_controller.dart';
import 'package:braver_forms/src/widgets/form_group_controllers.dart';
import 'package:flutter/material.dart';

class BraverForm extends StatefulWidget {
  final FormController? controller;
  final Map<String, FieldControl> formFields;
  final Widget content;
  final void Function(Map<String, dynamic> model) submitFunc;
  final List<String? Function(Map<String, dynamic> value)>? validators;
  BraverForm(
      {this.controller,
      required this.content,
      this.validators,
      required this.formFields,
      required this.submitFunc})
      : super(key: controller?.key);

  @override
  State<BraverForm> createState() => BraverFormState();
}

class BraverFormState extends State<BraverForm> {
  late final FormController _formController;
  Map<String, dynamic> formValues = {};
  Map<String, TextEditingController> formControllers = {};
  final _controller = StreamController<Map<String, dynamic>>();
  List<String> validationErrors = [];

  @override
  void initState() {
    super.initState();
    _formController = widget.controller ?? FormController();
    widget.formFields.forEach((key, value) {
      formValues[key] = value;
      formControllers = {key: TextEditingController(text: value.initialValue)};
    });
  }

  @override
  void dispose() {
    super.dispose();
    for (var element in formControllers.entries) {
      element.value.dispose();
    }
    _controller.close();
  }

  bool submit() {
    if (validate() == true) {
      // _formController.key.currentState!.save();
      widget.submitFunc(formValues);
      return true;
    }
    return false;
  }

  getControllers() {
    return formControllers;
  }

  Stream<Map<String, dynamic>> get onFormChange async* {
    yield formValues;
    yield* _controller.stream;
  }

  setValue(String key, dynamic val) {
    try {
      if (formControllers.containsKey(key)) {
        var ctrl = formControllers[key];
        ctrl!.value = TextEditingValue(text: val.toString());
        formValues[key] = val;
      }
    } catch (err) {
      print("e");
    }
  }

  bool validate() {
    bool fieldValidation = _formController.key.currentState!.validate();
    bool formValidation = true;
    List<String> tmpErrors = [];
    var validators = widget.validators;
    if (validators != null && validators.isNotEmpty) {
      formValidation = validators.every((validator) {
        String? error = validator(formValues);
        if (error != null) {
          tmpErrors.add(error);
        }
        return error == null;
      });
    }
    if (tmpErrors.isNotEmpty) {
      setState(() {
        validationErrors = tmpErrors;
      });
    }
    return fieldValidation && formValidation;
  }

  notifyListeners() {
    _controller.add(formValues);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: null,
        onWillPop: null,
        onChanged: null,
        // key: _formController.key,
        child: NotificationListener<FormEvent>(
            onNotification: (notification) {
              switch (notification.runtimeType) {
                case FormControllerValueChangedEvent:
                  {
                    var event = notification as FormControllerValueChangedEvent;
                    formValues[event.control.key] = event.control.value;
                    notifyListeners();
                    break;
                  }
                case FormSubmitEvent:
                  {
                    submit();
                    break;
                  }
                default:
                  {
                    log("notification");
                  }
              }
              return true;
            },
            child: FormGroupControllers(
              formGroup: formControllers,
              child: widget.content,
            )));
  }
}
