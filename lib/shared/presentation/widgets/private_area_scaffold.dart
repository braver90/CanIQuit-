import 'package:flutter/material.dart';

class PrivateAreaScaffold extends StatelessWidget {
  const PrivateAreaScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "First"),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Second",
          )
        ],
        onTap: (value) {
          // if (value == 0) {
          //   context.go("/first");
          // } else {
          //   context.go("/second");
          // }
        },
      ),
    );
  }
}
