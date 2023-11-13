import 'package:flutter/material.dart';

class IconSwitch extends StatefulWidget {
  final IconData? firstIcon;
  final IconData? secondtIcon;
  final Function onChange;
  final bool? initialValue;
  const IconSwitch(
      {Key? key,
      this.firstIcon,
      this.secondtIcon,
      required this.onChange,
      this.initialValue})
      : super(key: key);

  @override
  State<IconSwitch> createState() => _IconSwitchState();
}

class _IconSwitchState extends State<IconSwitch> {
  late List<bool> selectedList;
  @override
  void initState() {
    super.initState();
    var _initial = widget.initialValue;
    if (_initial != null) {
      selectedList = _initial == true ? [true, false] : [false, true];
    } else {
      selectedList = [false, false];
    }
  }

  @override
  Widget build(BuildContext context) {
    var _firstIcon = widget.firstIcon;
    var _secondIcon = widget.secondtIcon;
    var scheme = Theme.of(context).colorScheme;
    return ToggleButtons(
      onPressed: ((index) {
        setState(() {
          selectedList = List.generate(2, (i) => index == i);
        });
        widget.onChange(index == 0 ? true : false);
      }),
      isSelected: selectedList,
      borderRadius: BorderRadius.circular(25),
      selectedColor: scheme.onPrimary,
      fillColor: scheme.primary,
      selectedBorderColor: scheme.primary,
      children: [
        _firstIcon != null
            ? Icon(_firstIcon)
            : const Icon(Icons.check, size: 24),
        _secondIcon != null
            ? Icon(_secondIcon)
            : const Icon(Icons.close, size: 24)
      ],
    );
  }
}
