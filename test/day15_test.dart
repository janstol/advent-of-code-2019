import 'package:adventofcode2019/day15/day15.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Solution test", () {
      final day = Day15("lib/day15/input.txt");
      expect(day.solvePart01(), 296);
    });
  });

  group("Part 02", () {
    test("Solution test", () {
      final day = Day15("lib/day15/input.txt");
      expect(day.solvePart02(), 302);
    });
  });
}
