import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/common/intcode_computer.dart';

class Day05 extends Day<List<int>, int, int> {
  Day05(String input) : super(input);

  @override
  List<int> parseInput(String input) =>
      input.split(",").map(int.parse).toList();

  @override
  int solvePart01() {
    final computer = IntcodeComputer(input);
    return computer.run(inputInstructions: [1]);
  }

  @override
  int solvePart02() {
    final computer = IntcodeComputer(input);
    return computer.run(inputInstructions: [5]);
  }
}
