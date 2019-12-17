import 'dart:math';

import 'package:adventofcode2019/common/intcode_computer.dart';

class ASCII {
  final IntcodeComputer _computer;
  final _camera = <Point, int>{};
  final _cameraImage = StringBuffer();

  ASCII(List<int> program) : _computer = IntcodeComputer(program)..run();

  String get cameraImage => _cameraImage.toString();

  void processCameraImage() {
    int row = 0;
    int col = 0;

    _cameraImage.clear();
    _cameraImage.writeln();

    for (final c in _computer.output) {
      if (c == 10) {
        row++;
        col = 0;
        _cameraImage.writeln();
        continue;
      }

      _camera[Point(col, row)] = c;
      _cameraImage.write(String.fromCharCode(c));
      col++;
    }
  }

  List<Point> findIntersections() {
    final blocks = "#<>V^".codeUnits;

    final intersections = <Point>[];

    final scaffoldBlocks =
        _camera.entries.where((e) => blocks.contains(e.value)).toList();

    for (final p in scaffoldBlocks) {
      final neighbours = scaffoldBlocks.where((b) {
        return p.key == b.key + const Point(1, 0) ||
            p.key == b.key - const Point(1, 0) ||
            p.key == b.key + const Point(0, 1) ||
            p.key == b.key - const Point(0, 1);
      });

      if (neighbours.length == 4) {
        intersections.add(p.key);
      }
    }

    return intersections;
  }
}
