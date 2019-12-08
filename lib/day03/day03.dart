import 'dart:math';

import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/day03/intersections.dart';

class Day03 extends Day<List<String>, int, int> {
  Day03(String input) : super(input);

  @override
  List<String> parseInput(String input) => input.split("\n");

  @override
  int solvePart01() {
    final wire1 = input[0].trim().split(",").toList();
    final wire2 = input[1].trim().split(",").toList();

    return findIntersections(wire1, wire2)
        .keys
        .map((p) => p.x.abs() + p.y.abs())
        .reduce(min);
  }

  @override
  int solvePart02() {
    final wire1 = input[0].trim().split(",").toList();
    final wire2 = input[1].trim().split(",").toList();

    return findIntersections(wire1, wire2).values.reduce(min);
  }
}
