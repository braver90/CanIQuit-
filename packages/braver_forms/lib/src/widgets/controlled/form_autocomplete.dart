// import 'package:flutter/src/widgets/framework.dart';
// import 'package:brochfolio/core/widgets/Form/events/form_events.dart';
// import 'package:brochfolio/core/widgets/Form/models/autocomplete_option.dart';
// import 'package:brochfolio/core/widgets/Form/models/form_controller_value.dart';
// import 'package:brochfolio/core/widgets/Form/widgets/base_form_field.dart';
// import 'package:brochfolio/core/widgets/Form/widgets/simple/autocomplete.dart';

// class FormAutoComplete<T> extends BaseFormField {
//   final List<AutoCompleteOption<T>> options;
//   final AutoCompleteEmpty<T>? emptyResultItem;
//   final Widget Function(BuildContext, void Function(AutoCompleteOption<T>),
//       Iterable<AutoCompleteOption<T>>)? optionsViewBuilder;
//   final Function(T? val)? onSelect;
//   final Function? searchFunc;
//   final double? padding;
//   final bool? IsLoaded;
//   const FormAutoComplete(
//       {Key? key,
//       required this.options,
//       this.emptyResultItem,
//       this.optionsViewBuilder,
//       this.onSelect,
//       required super.label,
//       required super.formControlName,
//       super.initialValue,
//       super.onSaved,
//       super.validator,
//       this.searchFunc,
//       this.IsLoaded,
//       this.padding})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AppAutocomplete<T>(
//       label: label,
//       options: options,
//       emptyResultItem: emptyResultItem,
//       optionsViewBuilder: optionsViewBuilder,
//       validator: validator,
//       searchFunc: searchFunc,
//       padding: padding,
//       onSelect: (value) {
//         ControllerChangeValueEvent(FormControllerValue(
//                 formControlName: formControlName, value: value))
//             .dispatch(context);
//       },
//     );
//   }
// }
