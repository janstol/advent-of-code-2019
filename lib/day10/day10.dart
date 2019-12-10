import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/day10/asteroid_map.dart';

class Day10 extends Day<String, Asteroid, int> {
  Day10(String input) : super(input);

  @override
  String parseInput(String input) => input;

  @override
  Asteroid solvePart01() {
    return AsteroidMap(input).findBestAsteroid();
  }

  @override
  int solvePart02() {
    final map = AsteroidMap(input);
    final result = map.getNthVaporizedAsteroid(map.findBestAsteroid(), 200);
    return result.x * 100 + result.y;
  }
}
