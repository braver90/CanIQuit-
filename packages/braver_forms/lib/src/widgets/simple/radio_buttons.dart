// import 'package:flutter/material.dart';
// import 'package:brochfolio/core/widgets/Form/models/radio_option.dart';
// import 'package:brochfolio/core/widgets/text/app_text.dart';
// import 'package:collection/collection.dart';

// class RadioButtons<T> extends StatefulWidget {
//   final List<RadioButtonOption<T>> options;
//   final AxisDirection? direction;
//   final WrapAlignment? alignment;
//   final Function? onSelect;
//   const RadioButtons(
//       {Key? key,
//       required this.options,
//       this.direction = AxisDirection.down,
//       this.alignment = WrapAlignment.start,
//       this.onSelect})
//       : super(key: key);

//   @override
//   State<RadioButtons> createState() => _RadioButtonsState();
// }

// class _RadioButtonsState<T> extends State<RadioButtons<T>> {
//   late RadioButtonOption<T>? currentSelection;
//   @override
//   void initState() {
//     super.initState();
//     var _onSelect = widget.onSelect;
//     var initialValue =
//         widget.options.firstWhereOrNull((element) => element.isDefault == true);

//     currentSelection = initialValue;
//     if (initialValue != null && _onSelect != null) {
//       _onSelect(initialValue.value);
//     }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _onSelect = widget.onSelect;
//     var _alignment = widget.alignment;
//     return Wrap(
//         alignment: _alignment ?? WrapAlignment.start,
//         runSpacing: 10,
//         spacing: 10,
//         children: widget.options
//             .map((opt) => Row(mainAxisSize: MainAxisSize.min, children: [
//                   Radio<RadioButtonOption<T>>(
//                       value: opt,
//                       groupValue: currentSelection,
//                       onChanged: (value) {
//                         if (value != null) {
//                           setState(() {
//                             currentSelection = value;
//                           });
//                           if (_onSelect != null) {
//                             _onSelect(value.value);
//                           }
//                         }
//                       }),
//                   AppText(text: opt.label ?? ''),
//                 ]))
//             .toList());
//   }
// }
