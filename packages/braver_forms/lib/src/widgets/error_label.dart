import 'package:flutter/material.dart';

class ErrorLabel extends StatelessWidget {
  final String message;
  const ErrorLabel({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Text(
      message,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      style: textTheme.bodyMedium?.copyWith(color: colorScheme.error),
    );
  }
}
