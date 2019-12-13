import 'package:adventofcode2019/day13/day13.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Solution test", () {
      final day = Day13("lib/day13/input.txt");
      expect(day.solvePart01(), 251);
    });
  });

  group("Part 02", () {
    test("Solution test", () {
      final day = Day13("lib/day13/input.txt");
      expect(day.solvePart02(), 12779);
    });
  });
}
