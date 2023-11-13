// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:brochfolio/core/widgets/text/app_text_style.dart';

// class TextInput extends StatelessWidget {
//   const TextInput(
//       {Key? key,
//       this.controller,
//       required this.label,
//       this.onSaved,
//       this.formControlName,
//       this.initialValue,
//       this.onChange,
//       this.type,
//       this.suffixIcon,
//       this.validator,
//       this.focusNode,
//       this.obscureText = false})
//       : super(key: key);
//   final TextEditingController? controller;
//   final String label;
//   final Function? onSaved;
//   final String? Function(String?)? validator;
//   final String? formControlName;
//   final String? initialValue;
//   final TextInputType? type;
//   final Function(String)? onChange;
//   final Widget? suffixIcon;
//   final FocusNode? focusNode;
//   final bool obscureText;

//   @override
//   Widget build(BuildContext context) {
//     List<TextInputFormatter>? handleType() {
//       if (type == TextInputType.number) {
//         return [FilteringTextInputFormatter.digitsOnly];
//       }
//       if (type ==
//               const TextInputType.numberWithOptions(
//                   decimal: true, signed: true) ||
//           type ==
//               const TextInputType.numberWithOptions(
//                   decimal: true, signed: false)) {
//         return [
//           FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
//         ];
//       }
//       return null;
//     }

//     return Container(
//       margin: const EdgeInsets.all(5),
//       child: TextFormField(
//           focusNode: focusNode,
//           keyboardType: type,
//           onChanged: onChange,
//           validator: validator,
//           inputFormatters: handleType(),
//           onSaved: (newValue) {
//             if (onSaved != null) onSaved!(newValue);
//           },
//           controller: controller,
//           initialValue: initialValue,
//           obscureText: obscureText,
//           decoration: InputDecoration(
//               suffixIcon: suffixIcon,
//               labelStyle: TypographyLevels.bodyLong2,
//               border: const OutlineInputBorder(),
//               labelText: label)),
//     );
//   }
// }
