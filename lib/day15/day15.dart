import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/common/intcode_computer.dart';
import 'package:adventofcode2019/day15/reapair_droid.dart';

class Day15 extends Day<List<int>, int, int> {
  Day15(String input) : super(input);

  @override
  List<int> parseInput(String input) => IntcodeComputer.parseProgram(input);

  @override
  int solvePart01() {
    final droid = RepairDroid(input)..traverseShip();
    // droid.displayMap();
    return droid.oxygenSystemPath.length;
  }

  @override
  int solvePart02() {
    return RepairDroid(input).oxygenFill();
  }
}
