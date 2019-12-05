/// Modified [IntcodeComputer] from day 02.
class IntcodeComputerV2 {
  final List<int> program;
  final List<int> inputInstruction;

  const IntcodeComputerV2({this.program, this.inputInstruction});

  int run() {
    int pointer = 0;
    bool halt = false;

    while (pointer < program.length && halt == false) {
      final firstParam = "${program[pointer]}".padLeft(5, "0");
      final opcode = firstParam.substring(3);
      final mode1 = firstParam[2];
      final mode2 = firstParam[1];

      switch (opcode) {
        case "01": // add
          final in1 = _getParameterValue(pointer + 1, mode1);
          final in2 = _getParameterValue(pointer + 2, mode2);
          final dest = _getParameterValue(pointer + 3, ParameterMode.immediate);

          program[dest] = in1 + in2;

          pointer += 4;
          break;
        case "02": // multiply
          final in1 = _getParameterValue(pointer + 1, mode1);
          final in2 = _getParameterValue(pointer + 2, mode2);
          final dest = _getParameterValue(pointer + 3, ParameterMode.immediate);

          program[dest] = in1 * in2;

          pointer += 4;
          break;
        case "03": // input
          final in1 = _getParameterValue(pointer + 1, ParameterMode.immediate);
          program[in1] = inputInstruction.removeAt(0);

          pointer += 2;
          break;
        case "04": // output
          final in1 = _getParameterValue(pointer + 1, mode1);

          if (in1 != 0) {
            return in1;
          }
          pointer += 2;

          break;
        case "05": // jump-if-true
          final in1 = _getParameterValue(pointer + 1, mode1);
          pointer =
              in1 != 0 ? _getParameterValue(pointer + 2, mode2) : pointer + 3;

          break;
        case "06": // jump-if-false
          final in1 = _getParameterValue(pointer + 1, mode1);

          pointer =
              in1 == 0 ? _getParameterValue(pointer + 2, mode2) : pointer + 3;

          break;
        case "07": // less than
          final in1 = _getParameterValue(pointer + 1, mode1);
          final in2 = _getParameterValue(pointer + 2, mode2);
          final dest = _getParameterValue(pointer + 3, ParameterMode.immediate);

          program[dest] = (in1 < in2) ? 1 : 0;

          pointer += 4;
          break;
        case "08": // equals
          final in1 = _getParameterValue(pointer + 1, mode1);
          final in2 = _getParameterValue(pointer + 2, mode2);
          final dest = _getParameterValue(pointer + 3, ParameterMode.immediate);

          program[dest] = (in1 == in2) ? 1 : 0;

          pointer += 4;
          break;
        case "99": // halt
          halt = true;
          break;
        default:
          throw Exception("Something went wrong! Opcode: $opcode");
      }
    }

    throw Exception("Solution not found!");
  }

  int _getParameterValue(int position, String parameterMode) {
    switch (parameterMode) {
      case ParameterMode.position:
        return program[program[position]];
      case ParameterMode.immediate:
        return program[position];
      default:
        throw Exception("Parameter mode $parameterMode is not supported!");
    }
  }
}

abstract class ParameterMode {
  static const String position = "0";
  static const String immediate = "1";
}
