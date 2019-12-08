import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/day06/universal_orbit_map.dart';

class Day06 extends Day<List<List<String>>, int, int> {
  Day06(String input) : super(input);

  @override
  List<List<String>> parseInput(String input) =>
      input.split("\n").map((l) => l.trim().split(")")).toList();

  @override
  int solvePart01() {
    final uom = UniversalOrbitMap(input);
    return uom.totalOrbits;
  }

  @override
  int solvePart02() {
    final uom = UniversalOrbitMap(input);
    return uom.getOrbitalTransfersCount("YOU", "SAN");
  }
}
