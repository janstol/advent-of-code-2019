import 'dart:io';

void main() {
  final List<int> input = File("lib/day01/input.txt")
      .readAsStringSync()
      .split("\n")
      .map(int.parse)
      .toList();

  int fuelRequirement = 0;

  for (final int moduleMass in input) {
    fuelRequirement += (moduleMass / 3).floor() - 2;
  }

  print("Total fuel requirement: $fuelRequirement");
}
