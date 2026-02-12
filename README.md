## 🧲 drag_select_recycler_view

drag_select_recycler_view is a reusable Flutter library that provides RecyclerView-style drag multi-selection like Gallery apps, Google Photos, WhatsApp media picker, and file managers.

It allows users to long-press and drag across items to select multiple items continuously, without writing complex gesture handling or hit-detection logic.

This package focuses on real mobile UX — not just tapping checkboxes — but true touch-drag selection interaction.

----------------

## ✨ Feature Preview

- Long press to start selection
- Drag finger across grid to select items
- Tap to toggle selection
- Live selection counter support
- Selection controller (state manager)
- Blue overlay + checkmark UI
- Works with any widget (images, files, contacts)
- Grid / RecyclerView behavior
- Lightweight & easy integration

--------------

## 🎥 Preview 

https://github.com/user-attachments/assets/0d072e69-9fa1-42da-b784-e2e2b3f0bb48

--------------

## 📦 Installation

Add this to your pubspec.yaml:
```
dependencies:
  drag_select_recycler_view:
    git:
      url: https://github.com/your-username/drag_select_recycler_view.git
```
then run:
```
flutter pub get
```

----------------

## 📁 File Structure
```
drag_select_recycler_view/
│
├─ lib/
│   ├─ drag_select_recycler_view.dart     # Main library export
│   │
│   └─ src/
│       ├─ controller/
│       │     selection_controller.dart   # Selection state manager
│       │
│       ├─ gesture/
│       │     drag_selection_gesture.dart # Detects long-press drag movement
│       │
│       ├─ models/
│       │     selection_item.dart         # Selection item model
│       │
│       ├─ utils/
│       │     auto_scroll_manager.dart    # Auto scroll when dragging near edges
│       │
│       └─ widgets/
│             drag_select_grid.dart       # RecyclerView grid engine
│             drag_select_item.dart       # Individual selectable item
│             drag_selection_overlay.dart # Blue overlay & checkmark UI
│
├─ example/
│   └─ main.dart                          # Example usage app
│
├─ pubspec.yaml
├─ README.md
└─ LICENSE
```

----------------------------

## 🚀 How to Use in Another Project

1️⃣ Import the package
```
import 'package:drag_select_recycler_view/drag_select_recycler_view.dart';
```

2️⃣ Create a controller
```
final controller = DragSelectionController();
```

3️⃣ Use the grid
```
DragSelectGrid(
  controller: controller,
  itemCount: 50,
  crossAxisCount: 3,
  itemBuilder: (context, index) {
    return Container(
      margin: const EdgeInsets.all(4),
      color: Colors.grey,
      child: Center(child: Text("$index")),
    );
  },
)
```

------------------------

## 🧪 How to Use in main.dart
```
import 'package:flutter/material.dart';
import 'package:drag_select_recycler_view/drag_select_recycler_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GalleryPage(),
    );
  }
}

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {

  final controller = DragSelectionController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: AnimatedBuilder(
          animation: controller,
          builder: (_, __) {
            return Text("${controller.selectionCount} selected");
          },
        ),
      ),

      body: DragSelectGrid(
        controller: controller,
        itemCount: 100,
        crossAxisCount: 4,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.primaries[index % Colors.primaries.length],
            child: Center(
              child: Text(
                "$index",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
```

-------------------

## 📊 DragSelectionController Properties

## ⚙️ DragSelectGrid Properties

| Property         | Type                      | Required | Default | Description                                |
| ---------------- | ------------------------- | -------- | ------- | ------------------------------------------ |
| `controller`     | `DragSelectionController` | ✔ Yes    | —       | Manages selection state and selected items |
| `itemCount`      | `int`                     | ✔ Yes    | —       | Total number of items in the grid          |
| `itemBuilder`    | `IndexedWidgetBuilder`    | ✔ Yes    | —       | Builds each grid item widget               |
| `crossAxisCount` | `int`                     | ❌ No     | `3`     | Number of columns in the grid              |

---

## 🎮 DragSelectionController Properties

| Property          | Type        | Description                                |
| ----------------- | ----------- | ------------------------------------------ |
| `selectionCount`  | `int`       | Total number of selected items             |
| `selectedIndexes` | `List<int>` | List of selected item indexes              |
| `isSelecting`     | `bool`      | Indicates whether selection mode is active |

---

## 🔧 DragSelectionController Methods

| Method                  | Parameters  | Description                                        |
| ----------------------- | ----------- | -------------------------------------------------- |
| `startSelection(index)` | `int index` | Starts selection mode and selects the first item   |
| `toggle(index)`         | `int index` | Selects or deselects the item                      |
| `select(index)`         | `int index` | Selects an item (used while dragging)              |
| `clear()`               | —           | Clears all selected items and exits selection mode |
| `isSelected(index)`     | `int index` | Returns true if item is selected                   |

---

## 🧩 DragSelectItem Behavior

| Action            | Result                      |
| ----------------- | --------------------------- |
| Long press        | Starts selection mode       |
| Drag across items | Multiple items get selected |
| Tap on item       | Toggle select/deselect      |
| Clear controller  | Exit selection mode         |


------------------

## 📄 License (MIT)
```
MIT License

Copyright (c) 2026 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

```




