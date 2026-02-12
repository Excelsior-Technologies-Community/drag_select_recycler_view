import 'package:flutter/material.dart';
import '../controller/selection_controller.dart';
import '../utils/auto_scroll_manager.dart';
import '../gesture/drag_selection_gesture.dart';
import 'drag_select_item.dart';

class DragSelectGrid extends StatefulWidget {

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final DragSelectionController controller;
  final int crossAxisCount;

  const DragSelectGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.controller,
    this.crossAxisCount = 3,
  });

  @override
  State<DragSelectGrid> createState() => _DragSelectGridState();
}

class _DragSelectGridState extends State<DragSelectGrid> {

  final ScrollController _scrollController = ScrollController();
  late AutoScrollManager _autoScrollManager;

  final Map<int, GlobalKey> _itemKeys = {};

  @override
  void initState() {
    super.initState();
    _autoScrollManager = AutoScrollManager(_scrollController);
  }

  int? _findItemIndex(Offset globalPosition) {

    for (var entry in _itemKeys.entries) {

      final key = entry.value;
      final context = key.currentContext;

      if (context == null) continue;

      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);
      final size = box.size;

      final rect = position & size;

      if (rect.contains(globalPosition)) {
        return entry.key;
      }
    }

    return null;
  }

  void _onDragUpdate(Offset position) {

    _autoScrollManager.startAutoScroll(position, context);

    final index = _findItemIndex(position);

    if (index != null) {
      widget.controller.select(index);
    }
  }

  @override
  Widget build(BuildContext context) {

    return DragSelectionGesture(

      onDragStart: () {},

      onDragEnd: () {
        _autoScrollManager.stopAutoScroll();
      },

      onDragUpdate: _onDragUpdate,

      child: AnimatedBuilder(
        animation: widget.controller,
        builder: (_, __) {

          return GridView.builder(
            controller: _scrollController,
            itemCount: widget.itemCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.crossAxisCount,
            ),
            itemBuilder: (context, index) {

              _itemKeys.putIfAbsent(index, () => GlobalKey());

              return Container(
                key: _itemKeys[index],
                padding: const EdgeInsets.all(4),
                child: DragSelectItem(
                  index: index,
                  controller: widget.controller,
                  onDragEnter: (i) => widget.controller.select(i),
                  child: widget.itemBuilder(context, index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
