import 'package:flutter/material.dart';

class DragSelectionOverlay extends StatelessWidget {
  const DragSelectionOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.45),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
