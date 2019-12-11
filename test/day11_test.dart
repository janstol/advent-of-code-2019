import 'package:adventofcode2019/day11/day11.dart';
import 'package:adventofcode2019/day11/emergency_hull_painting_robot.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Test 01", () {
      final robot = EmergencyHullPaintingRobot(
        program: [],
        currentPanel: Panel.black(0, 0),
      );
      robot.startTest([
        [1, 0],
        [0, 0],
        [1, 0],
        [1, 0],
        [0, 1],
        [1, 0],
        [1, 0]
      ]);
      expect(robot.paintedPanels.toSet().length, 6);
    });

    test("Solution test", () {
      final day = Day11("lib/day11/input.txt");
      expect(day.solvePart01(), 2373);
    });
  });

  group("Part 02", () {
    test("Solution test", () {
      final day = Day11("lib/day11/input.txt");

      const res = "\n"
          " ###   ##  #  # ###  #    ###  #  # #  #   \n"
          " #  # #  # # #  #  # #    #  # #  # # #   \n"
          " #  # #    ##   #  # #    #  # #  # ##    \n"
          " ###  #    # #  ###  #    ###  #  # # #   \n"
          " #    #  # # #  # #  #    #    #  # # #   \n"
          " #     ##  #  # #  # #### #     ##  #  # ";

      expect(day.solvePart02(), res);
    });
  });
}
