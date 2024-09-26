import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

interface class MultiSelectItem<T> {
  MultiSelectItem({required this.id, required this.item});
  final int id;
  final T item;
  @override
  String toString() {
    return '{id: $id-nombre: $item}';
  }
}

class MultiSelect<T> extends StatefulWidget {
  final List<MultiSelectItem<T>> items;
  final List<MultiSelectItem<T>>? itemsSelected;
  final bool isMultiSelect;
  final Widget Function(
    BuildContext context,
    T item,
    bool isSelect,
  ) itemBuilder;
  final void Function(List<MultiSelectItem<T>>)? onSelect;
  const MultiSelect({
    required this.items,
    required this.itemBuilder,
    super.key,
    this.onSelect,
    this.itemsSelected,
    this.isMultiSelect = true,
  });

  @override
  State<MultiSelect<T>> createState() => _MultiSelectState();
}

class _MultiSelectState<R> extends State<MultiSelect<R>> {
  late List<MultiSelectItem<R>> listSelect;
  @override
  void initState() {
    super.initState();
    listSelect = widget.itemsSelected ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      // crossAxisAlignment: WrapCrossAlignment.end,
      alignment: WrapAlignment.center,
      // runAlignment: WrapAlignment.start,
      runSpacing: 10,
      children: List.generate(widget.items.length, (index) {
        final item = widget.items[index];
        final isSelect = listSelect.any((element) => item.id == element.id);
        return GestureDetector(
          onTap: () {
            if (!widget.isMultiSelect) {
              listSelect.clear();
              listSelect.add(widget.items[index]);
            } else {
              final indexExists = listSelect.indexWhere((element) => widget.items[index].id == element.id);
              if (indexExists != -1) {
                listSelect.removeAt(indexExists);
              } else {
                listSelect.add(widget.items[index]);
              }
            }
            widget.onSelect?.call(listSelect);
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(2.5),
            color: isSelect ? Colors.transparent : Colors.transparent,
            child: widget.itemBuilder(context, item.item, isSelect),
          ).animate(target: isSelect ? 1 : 0).shake(rotation: 0.025, hz: 5),
        );
      }),
    );
  }
}
