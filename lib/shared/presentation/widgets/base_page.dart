import 'package:flutter/material.dart';

class BasePage extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  const BasePage({super.key, this.appBar, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: body,
      ),
    );
  }
}
