import 'package:adventofcode2019/common/intcode_computer.dart';
import 'package:adventofcode2019/day07/day07.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Test 01", () {
      final sequence = [4, 3, 2, 1, 0];
      final program = IntcodeComputer.parseProgram(
          "3,15,3,16,1002,16,10,16,1,16,15,15,4,15,99,0,0");

      final computer = IntcodeComputer(program);

      int out = 0;
      for (final i in sequence) {
        out = computer.run(inputInstructions: [i, out]);
        computer.restart();
      }

      expect(out, 43210);
    });

    test("Test 02", () {
      final sequence = [0, 1, 2, 3, 4];
      final program = IntcodeComputer.parseProgram("3,23,3,24,1002,24,10,24,"
          "1002,23,-1,23,101,5,23,23,1,24,23,23,4,23,99,0,0");

      final computer = IntcodeComputer(program);

      int out = 0;
      for (final i in sequence) {
        out = computer.run(inputInstructions: [i, out]);
        computer.restart();
      }

      expect(out, 54321);
    });

    test("Test 03", () {
      final sequence = [1, 0, 4, 3, 2];
      final program = IntcodeComputer.parseProgram("3,31,3,32,1002,32,10,32,"
          "1001,31,-2,31,1007,31,0,33,1002,33,7,33,1,33,31,31,1,32,31,31,4,31,"
          "99,0,0,0");

      final computer = IntcodeComputer(program);

      int out = 0;
      for (final i in sequence) {
        out = computer.run(inputInstructions: [i, out]);
        computer.restart();
      }

      expect(out, 65210);
    });

    test("Solution test", () {
      final day = Day07("lib/day07/input.txt");
      expect(day.solvePart01(), 199988);
    });
  });

  group("Part 02", () {
    test("Test 01", () {
      final program = IntcodeComputer.parseProgram(
          "3,26,1001,26,-4,26,3,27,1002,27,2,27,1,27,26,27,4,27,1001,28,-1,28,"
          "1005,28,6,99,0,0,5");

      final phases = <int>[9, 8, 7, 6, 5];

      final computers = [
        IntcodeComputer(program),
        IntcodeComputer(program),
        IntcodeComputer(program),
        IntcodeComputer(program),
        IntcodeComputer(program),
      ];

      final List<List<int>> out = [[], [], [], [], []];

      for (int i = 0; i < computers.length; i++) {
        computers[i].run(inputInstructions: [phases[i]]);
        out[i] = computers[i].output;
      }

      out[4].add(0);

      while (computers.any((c) => c.running)) {
        for (int i = 0; i < computers.length; i++) {
          computers[i].run(inputInstructions: out[(i + 4) % computers.length]);
          out[i] = computers[i].output;
        }
      }

      expect(out[4].last, 139629729);
    });

    test("Test 02", () {
      final program = IntcodeComputer.parseProgram(
          "3,52,1001,52,-5,52,3,53,1,52,56,54,1007,54,5,55,1005,55,26,1001,54,"
          "-5,54,1105,1,12,1,53,54,53,1008,54,0,55,1001,55,1,55,2,53,55,53,"
          "4,53,1001,56,-1,56,1005,56,6,99,0,0,0,0,10");

      final phases = <int>[9, 7, 8, 5, 6];

      final computers = [
        IntcodeComputer(program),
        IntcodeComputer(program),
        IntcodeComputer(program),
        IntcodeComputer(program),
        IntcodeComputer(program),
      ];

      final List<List<int>> out = [[], [], [], [], []];

      for (int i = 0; i < computers.length; i++) {
        computers[i].run(inputInstructions: [phases[i]]);
        out[i] = computers[i].output;
      }

      out[4].add(0);

      while (computers.any((c) => c.running)) {
        for (int i = 0; i < computers.length; i++) {
          computers[i].run(inputInstructions: out[(i + 4) % computers.length]);
          out[i] = computers[i].output;
        }
      }

      expect(out[4].last, 18216);
    });

    test("Solution test", () {
      final day = Day07("lib/day07/input.txt");
      expect(day.solvePart02(), 17519904);
    });
  });
}
