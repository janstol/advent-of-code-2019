import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/day12/moon.dart';

class Day12 extends Day<List<String>, int, int> {
  Day12(String input) : super(input);

  @override
  List<String> parseInput(String input) => input.split("\n");

  @override
  int solvePart01() {
    final moons = input.map((l) => Moon.fromInput(l)).toList();

    for (int step = 0; step < 1000; step++) {
      simulate(moons);
    }
    return moons.map((m) => m.energy).reduce((a, b) => a + b);
  }

  @override
  int solvePart02() {
    final moons = input.map((l) => Moon.fromInput(l)).toList();
    return stepsToFirstState(moons);
  }
}
