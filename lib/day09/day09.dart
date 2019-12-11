import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/common/intcode_computer.dart';

class Day09 extends Day<List<int>, int, int> {
  Day09(String input) : super(input);

  @override
  List<int> parseInput(String input) => IntcodeComputer.parseProgram(input);

  @override
  int solvePart01() {
    final computer = IntcodeComputer(input)..run(inputInstructions: [1]);
    return computer.output.first;
  }

  @override
  int solvePart02() {
    final computer = IntcodeComputer(input)..run(inputInstructions: [2]);
    return computer.output.first;
  }
}
