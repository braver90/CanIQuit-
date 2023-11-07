import 'package:can_i_quit/features/simulator/application/simulator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimulatorPage extends StatefulWidget {
  const SimulatorPage({super.key});

  @override
  State<SimulatorPage> createState() => _SimulatorPageState();
}

class _SimulatorPageState extends State<SimulatorPage> {
  late final SimulatorCubit _simulatorCubit;
  @override
  void initState() {
    _simulatorCubit = context.read<SimulatorCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "SIMULATOR",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Form(
              child: Column(
            children: [
              TextField(
                controller: TextEditingController(),
              )
            ],
          ))
        ],
      ),
    );
  }
}
