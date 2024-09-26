// // ignore_for_file: avoid_field_initializers_in_const_classes, sort_constructors_first

// import 'package:flutter/material.dart';

// class AppSliverListFAB<T> extends StatelessWidget {
//   final List<T> items;
//   final Widget Function(BuildContext context, T item) itemBuilder;

//   const AppSliverListFAB({
//     required this.items,
//     required this.itemBuilder,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CustomScrollView(
//           slivers: [
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   final item = items[index];
//                   return itemBuilder(context, item);
//                 },
//                 childCount: items.length,
//               ),
//             ),
//           ],
//         ),
//         Positioned(
//           bottom: 16,
//           right: 16,
//           child: FloatingActionButton(
//             onPressed: () {
//               // Acción al presionar el FAB
//             },
//             child: const Icon(Icons.add),
//           ),
//         ),
//       ],
//     );
//   }
// }
