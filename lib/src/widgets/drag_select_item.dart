import 'package:flutter/material.dart';
import '../controller/selection_controller.dart';
import 'drag_selection_overlay.dart';

class DragSelectItem extends StatelessWidget {

  final int index;
  final Widget child;
  final DragSelectionController controller;
  final Function(int) onDragEnter;

  const DragSelectItem({
    super.key,
    required this.index,
    required this.child,
    required this.controller,
    required this.onDragEnter,
  });

  @override
  Widget build(BuildContext context) {

    final bool selected = controller.isSelected(index);

    return MouseRegion(
      onEnter: (_) {
        // For web/desktop drag support
        if (controller.isSelecting) {
          onDragEnter(index);
        }
      },
      child: GestureDetector(

        behavior: HitTestBehavior.opaque,

        // Start selection
        onLongPress: () {
          controller.startSelection(index);
        },

        // Toggle selection
        onTap: () {
          if (controller.isSelecting) {
            controller.toggle(index);
          }
        },

        child: Stack(
          children: [

            /// Original item
            Positioned.fill(
              child: child,
            ),

            /// Selection overlay
            if (selected)
              const Positioned.fill(
                child: DragSelectionOverlay(),
              ),
          ],
        ),
      ),
    );
  }
}
