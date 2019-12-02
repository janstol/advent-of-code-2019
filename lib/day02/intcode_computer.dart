class IntcodeComputer {
  static int compute(List<int> program) {
    for (var i = 0; i < program.length; i += 4) {
      final opcode = program[i];
      final input1 = program[program[i + 1]];
      final input2 = program[program[i + 2]];
      final dest = program[i + 3];

      if (opcode == 1) {
        program[dest] = input1 + input2;
      } else if (opcode == 2) {
        program[dest] = input1 * input2;
      } else if (opcode == 99) {
        break;
      } else {
        throw "Something went wrong!";
      }
    }

    return program[0];
  }

  static int findNounVerb(List<int> program, int number) {
    List<int> _program;

    for (int i = 0; i < 100; i++) {
      for (int j = 0; j < 100; j++) {
        _program = List<int>.from(program);
        _program[1] = i;
        _program[2] = j;

        if (number == compute(_program)) {
          return 100 * i + j;
        }
      }
    }

    return -1;
  }
}
