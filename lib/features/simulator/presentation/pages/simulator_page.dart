import 'package:braver_forms/braver_forms.dart';
import 'package:can_i_quit/features/simulator/application/simulator_cubit.dart';
import 'package:can_i_quit/features/simulator/domain/entities/simulator_params.dart';
import 'package:can_i_quit/shared/presentation/widgets/base_page.dart';
import 'package:flutter/material.dart';
import 'package:braver_forms/braver_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimulatorPage extends StatefulWidget {
  const SimulatorPage({super.key});

  @override
  State<SimulatorPage> createState() => _SimulatorPageState();
}

class _SimulatorPageState extends State<SimulatorPage> {
  late final SimulatorCubit _simulatorCubit;
  late final controller = FormController();
  @override
  void initState() {
    _simulatorCubit = context.read<SimulatorCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "SIMULATOR",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            BraverForm(
              // key: controller.key,
              controller: controller,
              content: Column(
                children: [
                  const BraverNumerInput(
                      label: "startAmount", formControlName: "startAmount"),
                  const BraverNumerInput(
                      label: "monthlyAmount", formControlName: "startAmount"),
                  const BraverNumerInput(
                      label: "inflation",
                      formControlName: "startAmount",
                      inputType: TextInputType.numberWithOptions()),
                  const BraverNumerInput(
                      label: "apr", formControlName: "startAmount"),
                  const BraverNumerInput(
                      label: "taxes", formControlName: "startAmount"),
                  ElevatedButton(
                      onPressed: () {
                        controller.submit();
                      },
                      child: const Text("submit"))
                ],
              ),
              formFields: {
                "startAmount": FieldControl(
                  type: num,
                ),
                "monthlyAmount": FieldControl(
                  type: num,
                ),
                "inflation": FieldControl(
                  type: num,
                ),
                "apr": FieldControl(
                  type: num,
                ),
                "taxes": FieldControl(
                  type: num,
                ),
              },
              submitFunc: (value) {
                SimulatorParams.fromMap(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
