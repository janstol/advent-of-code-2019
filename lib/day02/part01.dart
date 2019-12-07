import 'dart:io';

import 'package:adventofcode2019/day02/intcode_computer.dart';

void main() {
  final List<int> input = File("lib/day02/input.txt")
      .readAsStringSync()
      .split(",")
      .map(int.parse)
      .toList();

  input[1] = 12;
  input[2] = 2;
  print(IntcodeComputer.compute(input));
}
