import 'package:braver_forms/braver_forms.dart';

class SimulatorParams {
  final String name;
  SimulatorParams({required this.name});

  factory SimulatorParams.fromMap(Map<String, dynamic> map) {
    return SimulatorParams(name: map["name"]);
  }
}
