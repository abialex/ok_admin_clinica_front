// ignore_for_file: avoid_field_initializers_in_const_classes, sort_constructors_first, lines_longer_than_80_chars

import 'package:flutter/material.dart';

class AppSliverList<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final Axis? scrollDirection;

  const AppSliverList({
    required this.items,
    required this.itemBuilder,
    this.scrollDirection,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: scrollDirection ?? Axis.vertical,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = items[index];
              return itemBuilder(context, item);
            },
            childCount: items.length,
          ),
        ),
      ],
    );
  }
}
