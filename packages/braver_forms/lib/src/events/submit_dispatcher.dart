import 'package:braver_forms/src/events/form_events.dart';
import 'package:flutter/material.dart';

class SubmitDispatcher extends StatelessWidget {
  final Widget child;
  const SubmitDispatcher({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FormSubmitEvent().dispatch(context);
        },
        child: AbsorbPointer(child: child));
  }
}
