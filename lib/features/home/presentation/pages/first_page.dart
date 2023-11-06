import 'package:flutter/material.dart';
import 'package:flutter_base_template/flavors.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("First Page${F.title}")),
    );
  }
}
