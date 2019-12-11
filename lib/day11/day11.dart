import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/common/intcode_computer.dart';
import 'package:adventofcode2019/day11/emergency_hull_painting_robot.dart';

class Day11 extends Day<List<int>, int, String> {
  Day11(String input) : super(input);

  @override
  List<int> parseInput(String input) => IntcodeComputer.parseProgram(input);

  @override
  int solvePart01() {
    final robot = EmergencyHullPaintingRobot(
      program: input,
      currentPanel: Panel.black(0, 0),
    )..start();
    return robot.paintedPanels.toSet().length;
  }

  @override
  String solvePart02() {
    final robot = EmergencyHullPaintingRobot(
      program: input,
      currentPanel: Panel.white(0, 0),
    )..start();

    return robot.printRegistrationIdentifier();
  }
}
