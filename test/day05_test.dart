import 'package:adventofcode2019/common/intcode_computer.dart';
import 'package:adventofcode2019/day05/day05.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Outputs whatever it gets as input", () {
      final computer = IntcodeComputer([3, 0, 4, 0, 99]);
      computer.run(inputInstructions: [1]);

      expect(computer.memory[0], 1);
    });

    test("Parameter modes", () {
      final computer = IntcodeComputer([1002, 4, 3, 4, 33]);
      computer.run();

      expect(computer.memory[4], 99);
    });

    test("Solution test", () {
      final day = Day05("lib/day05/input.txt");
      expect(day.solvePart01(), 12896948);
    });
  });

  group("Part 02", () {
    test("Equals 8 test", () {
      final computer = IntcodeComputer([3, 9, 8, 9, 10, 9, 4, 9, 99, -1, 8]);
      expect(computer.run(inputInstructions: [8]), 1);
      computer.restart();
      expect(computer.run(inputInstructions: [0]), 0);
      computer.restart();
      expect(computer.run(inputInstructions: [9]), 0);
    });

    test("Less than 8 test", () {
      final computer = IntcodeComputer([3, 9, 7, 9, 10, 9, 4, 9, 99, -1, 8]);
      expect(computer.run(inputInstructions: [7]), 1);
      computer.restart();
      expect(computer.run(inputInstructions: [0]), 1);
      computer.restart();
      expect(computer.run(inputInstructions: [9]), 0);
    });

    test("Equals 8 test (immediate)", () {
      final computer = IntcodeComputer([3, 3, 1108, -1, 8, 3, 4, 3, 99]);
      expect(computer.run(inputInstructions: [8]), 1);
      computer.restart();
      expect(computer.run(inputInstructions: [0]), 0);
      computer.restart();
      expect(computer.run(inputInstructions: [9]), 0);
    });

    test("Less than 8 test (immediate)", () {
      final computer = IntcodeComputer([3, 3, 1107, -1, 8, 3, 4, 3, 99]);
      expect(computer.run(inputInstructions: [7]), 1);
      computer.restart();
      expect(computer.run(inputInstructions: [0]), 1);
      computer.restart();
      expect(computer.run(inputInstructions: [9]), 0);
    });

    test("Solution test", () {
      final day = Day05("lib/day05/input.txt");
      expect(day.solvePart02(), 7704130);
    });
  });
}
