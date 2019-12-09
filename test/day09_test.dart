import 'package:adventofcode2019/common/intcode_computer.dart';
import 'package:adventofcode2019/day09/day09.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Takes no input and produces a copy of itself as output", () {
      final program = IntcodeComputer.parseProgram(
          "109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99");

      final computer = IntcodeComputer(program)..run();

      expect(computer.output, program);
    });

    test("Should output a 16-digit number", () {
      final program =
          IntcodeComputer.parseProgram("1102,34915192,34915192,7,4,7,99,0");
      final computer = IntcodeComputer(program)..run();

      expect("${computer.output.first}".length, 16);
    });

    test("Should output the large number in the middle", () {
      final program = IntcodeComputer.parseProgram("104,1125899906842624,99");
      final computer = IntcodeComputer(program)..run();

      expect(computer.output.first, 1125899906842624);
    });

    test("Solution test", () {
      final day = Day09("lib/day09/input.txt");

      expect(day.solvePart01(), 2932210790);
    });
  });

  group("Part 02", () {
    test("Solution test", () {
      final day = Day09("lib/day09/input.txt");

      expect(day.solvePart02(), 73144);
    });
  });
}
