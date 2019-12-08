import 'dart:math';

import 'package:adventofcode2019/day03/day03.dart';
import 'package:adventofcode2019/day03/intersections.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Test 01", () {
      final input =
          "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83"
              .split("\n");

      final wire1 = input[0].trim().split(",").toList();
      final wire2 = input[1].trim().split(",").toList();

      final distance = findIntersections(wire1, wire2)
          .keys
          .map((p) => p.x.abs() + p.y.abs())
          .reduce(min);

      expect(distance, 159);
    });

    test("Test 02", () {
      final input = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R5\n"
              "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
          .split("\n");

      final wire1 = input[0].trim().split(",").toList();
      final wire2 = input[1].trim().split(",").toList();

      final distance = findIntersections(wire1, wire2)
          .keys
          .map((p) => p.x.abs() + p.y.abs())
          .reduce(min);

      expect(distance, 135);
    });

    test("Solution test", () {
      final day = Day03("lib/day03/input.txt");
      expect(day.solvePart01(), 2427);
    });
  });

  group("Part 02", () {
    test("Test 01", () {
      final input = "R75,D30,R83,U83,L12,D49,R71,U7,L72\n"
              "U62,R66,U55,R34,D71,R55,D58,R83"
          .split("\n");

      final wire1 = input[0].trim().split(",").toList();
      final wire2 = input[1].trim().split(",").toList();

      expect(findIntersections(wire1, wire2).values.reduce(min), 610);
    });

    test("Test 02", () {
      final input = "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51\n"
              "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7"
          .split("\n");

      final wire1 = input[0].trim().split(",").toList();
      final wire2 = input[1].trim().split(",").toList();

      expect(findIntersections(wire1, wire2).values.reduce(min), 410);
    });

    test("Solution test", () {
      final day = Day03("lib/day03/input.txt");
      expect(day.solvePart02(), 27890);
    });
  });
}
