import 'package:braver_forms/src/events/form_events.dart';
import 'package:flutter/material.dart';

class FormSubmitter extends StatelessWidget {
  final Widget child;
  const FormSubmitter({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FormSubmitEvent().dispatch(context);
      },
      child: IgnorePointer(child: child),
    );
  }
}
