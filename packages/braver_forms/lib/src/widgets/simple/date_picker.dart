// import 'package:flutter/material.dart';
// import 'package:brochfolio/core/utils/formatter.dart';
// import 'package:brochfolio/core/widgets/Form/events/form_events.dart';
// import 'package:brochfolio/core/widgets/Form/models/form_controller_value.dart';
// import 'package:brochfolio/core/widgets/Form/widgets/simple/textinput.dart';

// class DatePicker extends StatefulWidget {
//   const DatePicker(
//       {Key? key,
//       this.controller,
//       required this.label,
//       this.onSaved,
//       this.formControlName,
//       this.initialValue,
//       this.onChange,
//       this.type,
//       this.initialDate,
//       this.firstDate,
//       this.lastDate,
//       this.validator})
//       : super(key: key);
//   final TextEditingController? controller;
//   final String label;
//   final Function? onSaved;
//   final String? Function(String?)? validator;
//   final String? formControlName;
//   final String? initialValue;
//   final TextInputType? type;
//   final Function(String)? onChange;
//   final DateTime? initialDate;
//   final DateTime? firstDate;
//   final DateTime? lastDate;

//   @override
//   State<DatePicker> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   late DateTime selectedDate;
//   @override
//   void initState() {
//     super.initState();
//     selectedDate = widget.initialDate ?? DateTime.now();
//   }

//   String? Function(String?)? isAValidDate() {
//     return (String? value) {
//       if (value != null && value.isNotEmpty) {
//         try {
//           Formatter.parseDate(value);
//           var _validator = widget.validator;
//           if (_validator != null) {
//             return _validator(value);
//           }
//         } catch (e) {
//           return "La data inserita non è valida";
//         }
//       }
//       return null;
//     };
//   }

//   renderDatePicker(BuildContext context) async {
//     var _controller = widget.controller;
//     var _formControlName = widget.formControlName;
//     var pickedDate = await showDatePicker(
//         initialEntryMode: DatePickerEntryMode.calendarOnly,
//         keyboardType: TextInputType.datetime,
//         errorFormatText: "Inserita una data non valida",
//         helpText: "Seleziona una data",
//         context: context,
//         currentDate: selectedDate,
//         initialDate: selectedDate,
//         firstDate: widget.firstDate ?? DateTime(2010),
//         lastDate: widget.lastDate ?? DateTime(2025));
//     if (_controller != null && pickedDate != null) {
//       var formattedDate = Formatter.toDate(pickedDate);
//       _controller.value = TextEditingValue(text: formattedDate);

//       setState(() {
//         selectedDate = pickedDate;
//       });
//       if (_formControlName != null) {
//         ControllerChangeValueEvent(FormControllerValue(
//                 formControlName: _formControlName, value: formattedDate))
//             .dispatch(context);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var _controller = widget.controller;
//     return TextInput(
//         type: TextInputType.datetime,
//         controller: _controller,
//         label: widget.label,
//         formControlName: widget.formControlName,
//         initialValue: widget.initialValue,
//         onSaved: widget.onSaved,
//         validator: isAValidDate(),
//         suffixIcon: Material(
//           color: Colors.transparent,
//           child: IconButton(
//               icon: const Icon(Icons.calendar_today),
//               onPressed: () {
//                 renderDatePicker(context);
//               }),
//         ),
//         onChange: widget.onChange);
//   }
// }
