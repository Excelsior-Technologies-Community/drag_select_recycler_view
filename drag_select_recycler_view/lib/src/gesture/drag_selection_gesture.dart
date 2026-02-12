import 'package:flutter/material.dart';

typedef DragIndexCallback = void Function(Offset globalPosition);

class DragSelectionGesture extends StatelessWidget {

  final Widget child;
  final DragIndexCallback onDragUpdate;
  final VoidCallback onDragStart;
  final VoidCallback onDragEnd;

  const DragSelectionGesture({
    super.key,
    required this.child,
    required this.onDragUpdate,
    required this.onDragStart,
    required this.onDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onLongPressStart: (_) {
        onDragStart();
      },

      onLongPressMoveUpdate: (details) {
        onDragUpdate(details.globalPosition);
      },

      onLongPressEnd: (_) {
        onDragEnd();
      },

      child: child,
    );
  }
}
