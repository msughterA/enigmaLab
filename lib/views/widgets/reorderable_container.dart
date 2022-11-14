import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class CustomReorderableColumn extends StatefulWidget {
  final List<Widget>? children;
  const CustomReorderableColumn({super.key, this.children});

  @override
  State<CustomReorderableColumn> createState() => _ReoderableColumnState();
}

class _ReoderableColumnState extends State<CustomReorderableColumn> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableColumn(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.children ?? [],
      onReorder: (oldIndex, newIndex) {},
    );
  }

  void _reOrder(oldIndex, newIndex) {
    setState(() {
      Widget row = widget.children!.removeAt(oldIndex);
      widget.children!.insert(newIndex, row);
    });
  }
}
