import 'dart:io';

import 'package:adventofcode2019/day05/intcode_computer.dart';


void main() {
  final List<int> program = File("lib/day05/input.txt")
      .readAsStringSync()
      .split(",")
      .map(int.parse)
      .toList();

  final computer = IntcodeComputerV2(
    program: program,
    inputInstruction: [5],
  );
  print(computer.run());
}
