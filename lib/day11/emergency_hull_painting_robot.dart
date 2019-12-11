import 'dart:math';

import 'package:adventofcode2019/common/intcode_computer.dart';

class EmergencyHullPaintingRobot {
  final IntcodeComputer computer;
  int x = 0;
  int y = 0;
  Direction direction = Direction.up;
  Panel currentPanel;
  List<Panel> paintedPanels = [];

  /// [currentPanel] is also used as starting panel.
  EmergencyHullPaintingRobot({List<int> program, this.currentPanel})
      : computer = IntcodeComputer(program);

  void start() {
    while (computer.running) {
      computer.run(inputInstructions: [currentPanel.color.index]);

      currentPanel.color = Color.values[computer.output[0]]; //paint
      paintedPanels.add(currentPanel);
      _turn(computer.output[1]);
      _move();
      currentPanel = getCurrentPanel();
    }
  }

  /// Starts [EmergencyHullPaintingRobot] with test [outputs].
  void startTest(List<List<int>> outputs) {
    for (final out in outputs) {
      currentPanel.color = Color.values[out[0]]; //paint
      paintedPanels.add(currentPanel);
      _turn(out[1]);
      _move();
      currentPanel = getCurrentPanel();
    }
  }

  String printRegistrationIdentifier() {
    final rid = StringBuffer();
    rid.writeln();

    final cols = paintedPanels.map((p) => p.x).reduce(max);
    final rows = paintedPanels.map((p) => p.y).reduce(max) + 1;

    int col = 0;
    int row = 0;

    for (int i = 0; i < cols * rows; i++) {
      final panel = paintedPanels.lastWhere(
        (p) => p.x == col && p.y == row,
        orElse: () => Panel.black(col, row),
      );

      if (panel.color == Color.white) {
        rid.write("#");
      } else {
        rid.write(" ");
      }

      col++;

      if (i > 0 && i % cols == 0) {
        rid.writeln();
        row++;
        col = 0;
      }
    }

    return rid.toString();
  }

  Panel getCurrentPanel() {
    return paintedPanels.lastWhere(
      (p) => p.x == x && p.y == y,
      orElse: () => Panel.black(x, y),
    );
  }

  void _move() {
    switch (direction) {
      case Direction.up:
        y--;
        break;
      case Direction.right:
        x++;
        break;
      case Direction.down:
        y++;
        break;
      case Direction.left:
        x--;
        break;
    }
    //print("Moving in $direction to [$x, $y]");
  }

  /// t = 0 means it should turn left 90 degrees
  /// t = 1 means it should turn right 90 degrees.
  void _turn(int t) {
    if (t == 0) {
      direction =
          Direction.values[(direction.index - 1) % Direction.values.length];
    } else {
      direction =
          Direction.values[(direction.index + 1) % Direction.values.length];
    }
  }
}

class Panel {
  final int x;
  final int y;
  Color color;

  Panel(this.x, this.y, [this.color = Color.black]);

  Panel.white(int x, int y) : this(x, y, Color.white);

  Panel.black(int x, int y) : this(x, y, Color.black);

  @override
  String toString() => "Panel([$x, $y], $color)";

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ color.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Panel && x == other.x && y == other.y && color == other.color;
  }
}

enum Direction { up, right, down, left }
enum Color { black, white }
