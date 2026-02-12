import 'package:flutter/material.dart';

class DragSelectionController extends ChangeNotifier {

  final Set<int> _selected = {};

  bool _isSelecting = false;

  bool get isSelecting => _isSelecting;

  List<int> get selectedIndexes => _selected.toList();

  int get selectionCount => _selected.length;

  void startSelection(int index) {
    _isSelecting = true;
    _selected.add(index);
    notifyListeners();
  }

  void toggle(int index) {
    if (_selected.contains(index)) {
      _selected.remove(index);
    } else {
      _selected.add(index);
    }
    notifyListeners();
  }

  void select(int index) {
    if (!_selected.contains(index)) {
      _selected.add(index);
      notifyListeners();
    }
  }

  void clear() {
    _selected.clear();
    _isSelecting = false;
    notifyListeners();
  }

  bool isSelected(int index) {
    return _selected.contains(index);
  }
}
