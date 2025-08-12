// ignore_for_file: avoid_field_initializers_in_const_classes, sort_constructors_first, lines_longer_than_80_chars

import 'package:flutter/material.dart';

class AppGridSliverList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final double? maxCrossAxisExtent;
  final double itemHeight;
  final Axis? scrollDirection;

  const AppGridSliverList({
    required this.items,
    required this.itemBuilder,
    this.maxCrossAxisExtent,
    this.itemHeight = 200.0,
    this.scrollDirection,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: scrollDirection ?? Axis.vertical,
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = items[index];
              return SizedBox(
                height: itemHeight,
                child: itemBuilder(context, item),
              );
            },
            childCount: items.length,
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: maxCrossAxisExtent ?? itemHeight,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: (maxCrossAxisExtent ?? itemHeight) / itemHeight,
          ),
        ),
      ],
    );
  }
}
