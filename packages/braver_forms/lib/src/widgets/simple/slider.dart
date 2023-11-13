import 'package:flutter/material.dart';

class AppSlider extends StatefulWidget {
  final double value;
  final Function(double) onSelect;
  final double? max;
  final double? min;
  final int? step;
  final bool? isDisabled;
  const AppSlider(
      {Key? key,
      required this.value,
      required this.onSelect,
      this.max,
      this.step,
      this.isDisabled = false,
      this.min})
      : super(key: key);

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  late double currentValue;
  @override
  void initState() {
    super.initState();
    currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    var max = widget.max ?? 100;
    var min = widget.min ?? 0;
    var step = widget.step ?? 1;
    return Slider(
      divisions: (max - min) ~/ step,
      value: currentValue,
      onChanged: widget.isDisabled == false
          ? (double val) => setState(() {
                currentValue = val;
              })
          : null,
      max: widget.max ?? 100,
      min: widget.min ?? 0,
      onChangeEnd: (double val) => widget.onSelect(val),
    );
  }
}
