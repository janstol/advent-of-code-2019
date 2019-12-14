import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/day14/nanofactory.dart';

class Day14 extends Day<String, int, int> {
  Day14(String input) : super(input);

  @override
  String parseInput(String input) => input;

  @override
  int solvePart01() => Nanofactory(input).produce("FUEL", 1);

  @override
  int solvePart02() => Nanofactory(input).fuelProducedFromOre(1e12.toInt());
}
