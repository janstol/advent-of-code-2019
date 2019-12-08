import 'package:adventofcode2019/day01/day01.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Solution test", () {
      final day = Day01("lib/day01/input.txt");
      expect(day.solvePart01(), 3317659);
    });
  });

  group("Part 02", () {
    test("Solution test", () {
      final day = Day01("lib/day01/input.txt");
      expect(day.solvePart02(), 4973616);
    });
  });
}
