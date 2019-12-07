import 'dart:io';

void main() {
  final List<int> input = File("lib/day01/input.txt")
      .readAsStringSync()
      .split("\n")
      .map(int.parse)
      .toList();

  int fuelRequirement = 0;

  for (final int moduleMass in input) {
    int _fuelReq = (moduleMass / 3).floor() - 2;

    while (_fuelReq > 0) {
      fuelRequirement += _fuelReq;
      _fuelReq = (_fuelReq / 3).floor() - 2;
    }
  }

  print("Total fuel requirement: $fuelRequirement");
}
