import 'package:adventofcode2019/day06/day06.dart';
import 'package:adventofcode2019/day06/universal_orbit_map.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Test 01", () {
      final map = "COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L"
          .split("\n")
          .map((l) => l.trim().split(")"))
          .toList();

      final uom = UniversalOrbitMap(map);
      expect(uom.totalOrbits, 42);
    });

    test("Solution test", () {
      final day = Day06("lib/day06/input.txt");
      expect(day.solvePart01(), 119831);
    });
  });

  group("Part 02", () {
    test("Test 01", () {
      final map = "COM)B\nB)C\nC)D\nD)E\nE)F\nB)G\nG)H\nD)I\nE)J\nJ)K\nK)L\n"
              "K)YOU\nI)SAN"
          .split("\n")
          .map((l) => l.trim().split(")"))
          .toList();

      final uom = UniversalOrbitMap(map);
      expect(uom.getOrbitalTransfersCount("YOU", "SAN"), 4);
    });

    test("Solution test", () {
      final day = Day06("lib/day06/input.txt");
      expect(day.solvePart02(), 322);
    });
  });
}
