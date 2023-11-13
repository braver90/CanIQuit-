// import 'package:flutter/material.dart';
// import 'package:brochfolio/core/widgets/Form/models/autocomplete_option.dart';
// import 'package:brochfolio/core/widgets/Form/widgets/simple/textinput.dart';
// import 'package:brochfolio/core/widgets/text/app_text.dart';

// class AppAutocomplete<T> extends StatefulWidget {
//   final String label;
//   final List<AutoCompleteOption<T>> options;
//   final AutoCompleteEmpty<T>? emptyResultItem;
//   final Widget Function(BuildContext, void Function(AutoCompleteOption<T>),
//       Iterable<AutoCompleteOption<T>>)? optionsViewBuilder;
//   final Function(T? val)? onSelect;
//   final String? Function(String?)? validator;
//   final Function? searchFunc;
//   final double? padding;
//   final bool? isLoaded;
//   const AppAutocomplete(
//       {Key? key,
//       required this.label,
//       required this.options,
//       this.emptyResultItem,
//       this.optionsViewBuilder,
//       this.validator,
//       this.onSelect,
//       this.searchFunc,
//       this.padding,
//       this.isLoaded})
//       : super(key: key);

//   // const AppAutoComplete({Key? key}) : super(key: key);

//   @override
//   State<AppAutocomplete<T>> createState() => _AppAutocompleteState<T>();
// }

// class _AppAutocompleteState<T> extends State<AppAutocomplete<T>> {
//   late bool isLoading;
//   late TextEditingController _controller;
//   late FocusNode _focusNode;
//   late RenderBox box;
//   late Offset offset;
//   late String lastSearch;
//   @override
//   void initState() {
//     super.initState();
//     isLoading = false;
//     _controller = TextEditingController();
//     _focusNode = FocusNode();

//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       box = context.findRenderObject() as RenderBox;
//       offset = box.localToGlobal(Offset.zero);
//     });
//   }

//   @override
//   void didUpdateWidget(covariant AppAutocomplete<T> oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.options != widget.options) {
//       setState(() {
//         isLoading = false;
//       });
//       _controller.notifyListeners();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _searchFunc = widget.searchFunc;
//     final scheme = Theme.of(context).colorScheme;
//     final _padding = widget.padding ?? 4;

//     return LayoutBuilder(builder: (context, dims) {
//       var height = dims.maxHeight;
//       return RawAutocomplete<AutoCompleteOption<T>>(
//         focusNode: _focusNode,
//         textEditingController: _controller,
//         optionsBuilder: (TextEditingValue textEditingValue) {
//           if (textEditingValue.text == '') {
//             return Iterable<AutoCompleteOption<T>>.empty();
//           }
//           var opts = widget.options.where((option) {
//             return option.text
//                 .toLowerCase()
//                 .contains(textEditingValue.text.toLowerCase());
//           });
//           var _empty = widget.emptyResultItem;
//           if (opts.isEmpty && _empty != null) {
//             return Iterable<AutoCompleteOption<T>>.generate(1, ((index) {
//               return _empty;
//             }));
//           } else {
//             return opts;
//           }
//         },
//         fieldViewBuilder: (BuildContext context,
//             TextEditingController fieldTextEditingController,
//             FocusNode fieldFocusNode,
//             VoidCallback onFieldSubmitted) {
//           return TextInput(
//               onChange: _searchFunc != null
//                   ? (val) {
//                       if (val.length >= 3) {
//                         _searchFunc(val);
//                         setState(() {
//                           isLoading = true;
//                         });
//                       }
//                     }
//                   : null,
//               suffixIcon: isLoading
//                   ? CircularProgressIndicator.adaptive(
//                       backgroundColor: scheme.primary)
//                   : null,
//               validator: widget.validator,
//               controller: _controller,
//               label: widget.label,
//               focusNode: fieldFocusNode);
//         },
//         optionsViewBuilder: widget.optionsViewBuilder ??
//             (BuildContext context,
//                 AutocompleteOnSelected<AutoCompleteOption<T>> onSelected,
//                 Iterable<AutoCompleteOption<T>> options) {
//               final media = MediaQuery.of(context);
//               return Align(
//                   alignment: Alignment.topLeft,
//                   child: Material(
//                       color: Colors.transparent,
//                       elevation: 4.0,
//                       child: Container(
//                         padding:
//                             EdgeInsets.only(left: _padding, right: _padding),
//                         width: box.size.width,
//                         constraints: BoxConstraints(
//                             maxHeight: media.size.height * 0.2,
//                             minWidth: media.size.width / 2),
//                         child: ListView.builder(
//                           physics: const ClampingScrollPhysics(),
//                           padding: EdgeInsets.zero,
//                           shrinkWrap: true,
//                           itemCount: options.length,
//                           itemBuilder: (BuildContext context, int index) {
//                             final option = options.elementAt(index);

//                             return ConstrainedBox(
//                               constraints:
//                                   BoxConstraints(maxHeight: height * 0.5),
//                               child: ListTile(
//                                   leading: option.prefix,
//                                   onTap: () {
//                                     var _opt = option;
//                                     if ((_opt.runtimeType ==
//                                         AutoCompleteEmpty<T>)) {
//                                       (_opt as AutoCompleteEmpty<T>).onPress!();
//                                       onSelected(AutoCompleteOption(''));
//                                     } else {
//                                       onSelected(_opt);
//                                     }
//                                   },
//                                   title: AppText(text: option.text)),
//                             );
//                           },
//                         ),
//                       )));
//             },
//         onSelected: (AutoCompleteOption<T> selection) {
//           var _onSelect = widget.onSelect;
//           if (_onSelect != null) {
//             _onSelect(selection.value);
//           }
//         },
//       );
//     });
//   }
// }
