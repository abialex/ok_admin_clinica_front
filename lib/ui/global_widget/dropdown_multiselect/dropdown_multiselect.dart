import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

interface class MultiSelectItem<T> {
  final int id;
  final T item;

  MultiSelectItem({required this.id, required this.item});
  @override
  String toString() {
    return '{id: $id-nombre: $item}';
  }
}

class MultiSelect<T> extends StatefulWidget {
  final List<MultiSelectItem<T>> listItems;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final void Function(List<MultiSelectItem<T>>)? onSelect;
  const MultiSelect({
    super.key,
    required this.listItems,
    required this.itemBuilder,
    this.onSelect,
  });

  @override
  State<MultiSelect<T>> createState() => _MultiSelectState();
}

class _MultiSelectState<R> extends State<MultiSelect<R>> {
  List<MultiSelectItem<R>> listSelect = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemBuilder: (context, index) {
            final item = widget.listItems[index];
            return GestureDetector(
              onTap: () {
                int indexExists = listSelect.indexWhere((element) => widget.listItems[index].id == element.id);
                if (indexExists != -1) {
                  listSelect.removeAt(indexExists);
                } else {
                  listSelect.add(widget.listItems[index]);
                }
                widget.onSelect?.call((listSelect));
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(2.5),
                alignment: Alignment.center,
                color: listSelect.any((element) => widget.listItems[index].id == element.id) ? AppColors.redAccent : AppColors.lightFillColor,
                child: widget.itemBuilder(context, item.item),
              ),
            );
          },
          shrinkWrap: true,
          itemCount: widget.listItems.length,
        ),
      ],
    );
  }
}

  // Column(
  //         children: List.generate(
  //           list.length,
  //           (index) => GestureDetector(
  //             onTap: () {
  //               int indexExists = listSelect.indexWhere((element) => list[index].id == element.id);
  //               if (indexExists != -1) {
  //                 listSelect.removeAt(indexExists);
  //               } else {
  //                 listSelect.add(list[index]);
  //               }
  //               print(listSelect.any((element) => list[index].id == element.id));
  //               setState(() {});
  //             },
  //             child: Container(
  //               margin: const EdgeInsets.all(2.5),
  //               alignment: Alignment.center,
  //               color: listSelect.any((element) => list[index].id == element.id) ? AppColors.lightGray : AppColors.redAccent,
  //               child: Text(
  //                 list[index].nombre,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
      