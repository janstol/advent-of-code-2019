import 'dart:io';
import 'dart:math';

import 'package:adventofcode2019/day03/intersections.dart';


void main() {
  final List<String> input =
      File("lib/day03/input.txt").readAsStringSync().split("\n");

  final wire1 = input[0].trim().split(",").toList();
  final wire2 = input[1].trim().split(",").toList();

  final steps = findIntersections(wire1, wire2).values.reduce(min);

  print(steps);
}
