import 'dart:collection';
import 'dart:math';

import 'package:adventofcode2019/common/intcode_computer.dart';

class RepairDroid {
  final IntcodeComputer _computer;
  final _queue = Queue<List<StepDirection>>();
  final _map = <Tile>[];

  List<StepDirection> oxygenSystemPath = [];

  RepairDroid(List<int> program) : _computer = IntcodeComputer(program);

  List<StepDirection> traverseShip({List<StepDirection> steps}) {
    List<DroidStatus> output = [DroidStatus.space];
    List<StepDirection> current;

    _queue.addAll([
      [StepDirection.north],
      [StepDirection.south],
      [StepDirection.west],
      [StepDirection.east]
    ]);

    while (_queue.isNotEmpty) {
      output.clear();
      current = _queue.removeFirst();

      _computer.run(inputInstructions: current.map((d) => d.index).toList());
      output = _computer.output.map((i) => DroidStatus.values[i]).toList();
      _computer.restart();

      if (output.last == DroidStatus.space) {
        _queue.addAll(current.last.getNextDirections(current));
      } else if (output.last == DroidStatus.oxygenSystem) {
        oxygenSystemPath = current;
      }

      _map.add(Tile(_getPositionFromSteps(current), output.last));

      if (steps != null) {
        _computer.run(inputInstructions: steps.map((s) => s.index).toList());
      }
    }

    return steps != null ? current : oxygenSystemPath;
  }

  int oxygenFill() {
    final path = traverseShip();
    _computer.run(inputInstructions: path.map((s) => s.index).toList());

    return traverseShip(steps: path).length - 1;
  }

  void displayMap() {
    final sb = StringBuffer();
    sb.writeln();

    final minCol = _map.map((p) => p.position.x).reduce(min).toInt();
    final minRow = _map.map((p) => p.position.y).reduce(min).toInt();

    final cols = _map.map((p) => p.position.x).reduce(max) + minCol.abs() + 1;
    final rows = _map.map((p) => p.position.y).reduce(max) + minRow.abs() + 1;

    int col = minCol;
    int row = minRow;

    for (int i = 0; i < cols * rows; i++) {
      final tile = _map.lastWhere(
        (p) => p.position.x == col && p.position.y == row,
        orElse: () => Tile(Point(col, row), DroidStatus.space),
      );

      if (col == 0 && row == 0) {
        sb.write("S");
      } else {
        sb.write(tile.display());
      }

      col++;

      if (i != 0 && i % cols == 0) {
        sb.writeln();
        row++;
        col = minCol;
      }
    }

    print(sb);
  }

  Point _getPositionFromSteps(List<StepDirection> steps) {
    Point<int> position = const Point(0, 0);
    for (final step in steps) {
      switch (step) {
        case StepDirection.north:
          position -= const Point(0, 1);
          break;
        case StepDirection.south:
          position += const Point(0, 1);
          break;
        case StepDirection.west:
          position -= const Point(1, 0);
          break;
        case StepDirection.east:
          position += const Point(1, 0);
          break;
        default:
          break;
      }
    }

    return position;
  }
}

class Tile {
  final Point position;
  final DroidStatus type;

  const Tile(this.position, this.type);

  String display() {
    switch (type) {
      case DroidStatus.wall:
        return "#";
      case DroidStatus.oxygenSystem:
        return "O";
      default:
        return " "; // empty tile
    }
  }

  @override
  int get hashCode => position.hashCode ^ type.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Tile && position == other.position && type == other.type;
  }

  @override
  String toString() => "Tile($position, $type)";
}

enum StepDirection { none, north, south, west, east }
enum DroidStatus { wall, space, oxygenSystem }

extension on StepDirection {
  List<List<StepDirection>> getNextDirections(List<StepDirection> path) {
    return StepDirection.values
        .where((d) => !d.isOppositeTo(this) && d != StepDirection.none)
        .map((d) => [...path, d])
        .toList();
  }

  bool isOppositeTo(StepDirection direction) {
    return (this == StepDirection.north && direction == StepDirection.south) ||
        (this == StepDirection.south && direction == StepDirection.north) ||
        (this == StepDirection.west && direction == StepDirection.east) ||
        (this == StepDirection.east && direction == StepDirection.west);
  }
}
