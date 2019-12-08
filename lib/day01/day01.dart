import 'package:adventofcode2019/common/day.dart';

class Day01 extends Day<List<int>, int, int> {
  Day01(String input) : super(input);

  @override
  List<int> parseInput(String input) =>
      input.split("\n").map(int.parse).toList();

  @override
  int solvePart01() {
    int fuelRequirement = 0;

    for (final int moduleMass in input) {
      fuelRequirement += (moduleMass / 3).floor() - 2;
    }

    return fuelRequirement;
  }

  @override
  int solvePart02() {
    int fuelRequirement = 0;

    for (final int moduleMass in input) {
      int _fuelReq = (moduleMass / 3).floor() - 2;

      while (_fuelReq > 0) {
        fuelRequirement += _fuelReq;
        _fuelReq = (_fuelReq / 3).floor() - 2;
      }
    }

    return fuelRequirement;
  }
}
