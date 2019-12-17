import 'package:adventofcode2019/day17/day17.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Solution test", () {
      final day = Day17("lib/day17/input.txt");
      expect(day.solvePart01(), 11372);
    });
  });

  group("Part 02", () {
    test("Solution test", () {
      final day = Day17("lib/day17/input.txt");
      expect(day.solvePart02(), 1155497);
    });
  });
}
