import 'dart:io';

import 'package:adventofcode2019/day06/universal_orbit_map.dart';

void main() {
  final List<List<String>> input = File("lib/day06/input.txt")
      .readAsStringSync()
      .split("\n")
      .map((l) => l.trim().split(")"))
      .toList();

  final uom = UniversalOrbitMap(input);
  print(uom.getOrbitalTransfersCount("YOU", "SAN"));
}
