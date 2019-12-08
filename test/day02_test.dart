import 'package:adventofcode2019/common/intcode_computer.dart';
import 'package:adventofcode2019/day02/day02.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Test 01", () {
      final program =
          "1,9,10,3,2,3,11,0,99,30,40,50".split(",").map(int.parse).toList();
      final computer = IntcodeComputer(program);
      computer.run();

      expect(computer.memory[0], 3500);
    });

    test("Test 02", () {
      final program = "1,0,0,0,99".split(",").map(int.parse).toList();
      final computer = IntcodeComputer(program);
      computer.run();

      expect(computer.memory[0], 2);
    });

    test("Test 03", () {
      final program = "1,1,1,4,99,5,6,0,99".split(",").map(int.parse).toList();
      final computer = IntcodeComputer(program);
      computer.run();

      expect(computer.memory[0], 30);
    });

    test("Solution test", () {
      final day = Day02("lib/day02/input.txt");
      expect(day.solvePart01(), 5098658);
    });
  });

  group("Part 02", () {
    test("Solution test", () {
      final day = Day02("lib/day02/input.txt");
      expect(day.solvePart02(), 5064);
    });
  });
}
