import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollManager {

  final ScrollController scrollController;
  Timer? _timer;

  AutoScrollManager(this.scrollController);

  void startAutoScroll(Offset position, BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    const edgeSize = 80.0;
    const scrollSpeed = 20.0;

    if (position.dy < edgeSize) {
      _startScrolling(-scrollSpeed);
    }
    else if (position.dy > height - edgeSize) {
      _startScrolling(scrollSpeed);
    } else {
      stopAutoScroll();
    }
  }

  void _startScrolling(double offset) {
    _timer ??= Timer.periodic(const Duration(milliseconds: 16), (_) {
      scrollController.jumpTo(
        scrollController.offset + offset,
      );
    });
  }

  void stopAutoScroll() {
    _timer?.cancel();
    _timer = null;
  }
}
