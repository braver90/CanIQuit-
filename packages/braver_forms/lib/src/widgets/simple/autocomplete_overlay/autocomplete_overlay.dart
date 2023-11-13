// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:brochfolio/core/widgets/Form/models/options.model.dart';
// import 'package:brochfolio/core/widgets/tile/tile.dart';

// class AppAutocompleteWithOverlay<T> extends StatefulWidget {
//   final Function searchFunc;
//   final List<Option<T>>? options;
//   final Function? onSaved;
//   final Widget? suffix;
//   const AppAutocompleteWithOverlay(
//       {Key? key,
//       this.options,
//       required this.searchFunc,
//       this.onSaved,
//       this.suffix})
//       : super(key: key);

//   @override
//   State<AppAutocompleteWithOverlay> createState() =>
//       _AppAutocompleteWithOverlayState();
// }

// class _AppAutocompleteWithOverlayState<T>
//     extends State<AppAutocompleteWithOverlay<T>> {
//   late TextEditingController _controller;
//   late OverlayState? overlay;
//   late RenderBox box;
//   late Offset offset;
//   final LayerLink link = LayerLink();
//   final FocusNode focusnode = FocusNode();
//   bool isLoading = false;
//   OverlayEntry? list;
//   Option<T>? model;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       overlay = Overlay.of(context);
//       box = context.findRenderObject() as RenderBox;
//       offset = box.localToGlobal(Offset.zero);
//       list = renderOverlay();
//     });
//   }

//   @override
//   void didUpdateWidget(AppAutocompleteWithOverlay oldWdiget) {
//     super.didUpdateWidget(widget);

//     setState(() {
//       isLoading = false;
//       if (widget.options!.isNotEmpty) {
//         if (focusnode.hasFocus && list!.mounted) {
//           log("Remove Aggiornamento");
//           list?.remove();
//         }
//         list = renderOverlay();
//       }
//     });
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       if (widget.options!.isNotEmpty && !list!.mounted) {
//         log("Insert-Aggiornamento");
//         overlay?.insert(list!);
//       }
//     });
//   }

//   OverlayEntry renderOverlay() {
//     return OverlayEntry(
//       builder: (context) => Positioned(
//           width: box.size.width,
//           top: offset.dy + box.size.height,
//           left: offset.dx,
//           child: CompositedTransformFollower(
//             link: link,
//             showWhenUnlinked: false,
//             offset: Offset(0, box.size.height),
//             child: Container(
//                 width: box.size.width,
//                 constraints: const BoxConstraints(maxHeight: 400),
//                 child: ListView(
//                   children: widget.options
//                           ?.map<AppTile>((e) => AppTile(
//                                 title: e.label,
//                                 onTap: () {
//                                   _controller.text = e.label;
//                                   setState(() {
//                                     model = e;
//                                   });
//                                   FocusScope.of(context).unfocus();
//                                 },
//                               ))
//                           .toList() ??
//                       [],
//                 )),
//           )),
//     );
//   }

//   handleListVisibility(bool hasToBeShown) {
//     if (hasToBeShown && widget.options!.isNotEmpty) {
//       overlay!.insert(list!);
//       log("Insert-Click");
//     }
//     if (!hasToBeShown && widget.options!.isNotEmpty) {
//       log("Remove-CLICK");
//       list!.remove();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorScheme = Theme.of(context).colorScheme;
//     return CompositedTransformTarget(
//       link: link,
//       child: Focus(
//         focusNode: focusnode,
//         onFocusChange: (value) => Future.delayed(
//             const Duration(milliseconds: 100),
//             () => handleListVisibility(value)),
//         child: Container(
//           margin: const EdgeInsets.all(5),
//           child: TextFormField(
//               onSaved: (value) {
//                 widget.onSaved!(model?.model ?? value);
//               },
//               controller: _controller,
//               onChanged: (val) {
//                 if (val.length >= 3) {
//                   widget.searchFunc(val);
//                   setState(() {
//                     isLoading = true;
//                   });
//                 }
//               },
//               decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(color: colorScheme.primary)),
//                   labelText: 'Search',
//                   suffix: widget.suffix,
//                   suffixIcon: isLoading
//                       ? CircularProgressIndicator.adaptive(
//                           backgroundColor: colorScheme.primary)
//                       : null)),
//         ),
//       ),
//     );
//   }
// }
