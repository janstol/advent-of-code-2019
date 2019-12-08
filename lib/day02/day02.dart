import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/common/intcode_computer.dart';

class Day02 extends Day<List<int>, int, int> {
  Day02(String input) : super(input);

  @override
  List<int> parseInput(String input) =>
      input.split(",").map(int.parse).toList();

  @override
  int solvePart01() {
    final program = List<int>.from(input);
    final computer = IntcodeComputer(program);

    computer.run(subs: {1: 12, 2: 2});

    return computer.memory[0];
  }

  @override
  int solvePart02() {
    for (int noun = 0; noun < 100; noun++) {
      for (int verb = 0; verb < 100; verb++) {
        final computer = IntcodeComputer(List<int>.from(input));
        computer.run(subs: {1: noun, 2: verb});

        if (computer.memory[0] == 19690720) {
          return 100 * noun + verb;
        }
      }
    }

    return -1;
  }
}
