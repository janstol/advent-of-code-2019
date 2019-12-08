import 'dart:io';

abstract class Day<IN, OUT1, OUT2> {
  IN _input;

  Day(String input, {bool rawInput = false}) {
    _input = parseInput(rawInput ? input : File(input).readAsStringSync());
  }

  IN get input => _input;

  IN parseInput(String input);

  OUT1 solvePart01();

  OUT2 solvePart02();
}
