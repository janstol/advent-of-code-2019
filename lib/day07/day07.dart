import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/common/intcode_computer.dart';
import 'package:adventofcode2019/common/extensions.dart';

class Day07 extends Day<List<int>, int, int> {
  Day07(String input) : super(input);

  @override
  List<int> parseInput(String input) =>
      input.split(",").map(int.parse).toList();

  @override
  int solvePart01() {
    final phases = <int>[0, 1, 2, 3, 4];

    int max = 0;

    final computer = IntcodeComputer(input);

    for (final sequence in phases.permutate()) {
      int out = 0;
      for (final num in sequence) {
        out = computer.run(inputInstructions: [num, out]);
        computer.restart();
      }

      if (out > max) {
        max = out;
      }
      computer.restart();
    }

    return max;
  }

  @override
  int solvePart02() {
    final phases = <int>[5, 6, 7, 8, 9];

    final computers = [
      IntcodeComputer(input),
      IntcodeComputer(input),
      IntcodeComputer(input),
      IntcodeComputer(input),
      IntcodeComputer(input),
    ];

    int max = 0;
    final List<List<int>> out = [[], [], [], [], []];

    for (final sequence in phases.permutate()) {
      for (final computer in computers) {
        computer.restart();
      }

      for (int i = 0; i < computers.length; i++) {
        computers[i].run(inputInstructions: [sequence[i]]);
        out[i] = computers[i].output;
      }

      out[4].add(0);

      while (computers.any((c) => c.running)) {
        for (int i = 0; i < computers.length; i++) {
          computers[i].run(inputInstructions: out[(i + 4) % computers.length]);
          out[i] = computers[i].output;
        }
      }

      if (out[4].last > max) {
        max = out[4].last;
      }
    }

    return max;
  }
}
