import 'dart:async';

class IntcodeComputer {
  /// Program that will be loaded into [memory].
  List<int> program;

  /// Computer memory where [program] runs.
  List<int> memory;

  /// Input instructions.
  List<int> inputInstructions;

  List<int> output = [];

  /// Pointer to [memory].
  int pointer = 0;

  bool _running = true;

  /// Creates [IntcodeComputer].
  ///
  /// Provide [program] that will be loaded into [memory].
  IntcodeComputer(this.program) : memory = List<int>.of(program);

  /// Indicates whether computer is running or not (halt).
  bool get running => _running;

  int run({
    Map<int, int> subs = const {},
    List<int> inputInstructions,
  }) {
    _substituteMemory(subs);

    int opCode;

    while (opCode != 99) {
      opCode = _getOpCodeParams()[0];

      switch (opCode) {
        case 1: // add
          final val1 = _getParameter(1);
          final val2 = _getParameter(2);
          final dest = _getParameter(3, ParameterMode.immediate);

          memory[dest] = val1 + val2;
          pointer += 4;
          break;

        case 2: // multiply
          final val1 = _getParameter(1);
          final val2 = _getParameter(2);
          final dest = _getParameter(3, ParameterMode.immediate);

          memory[dest] = val1 * val2;
          pointer += 4;
          break;

        case 3: // input
          if (inputInstructions.isEmpty) return null;

          final val = _getParameter(1, ParameterMode.immediate);
          memory[val] =
              inputInstructions.isNotEmpty ? inputInstructions.removeAt(0) : -1;
          pointer += 2;
          break;

        case 4: // output
          output.add(_getParameter(1));
          pointer += 2;
          break;

        case 5: // jump-if-true
          final val = _getParameter(1);
          pointer = val != 0 ? _getParameter(2) : pointer + 3;
          break;

        case 6: // jump-if-false
          final val = _getParameter(1);
          pointer = val == 0 ? _getParameter(2) : pointer + 3;
          break;

        case 7: // less than
          final val1 = _getParameter(1);
          final val2 = _getParameter(2);
          final dest = _getParameter(3, ParameterMode.immediate);

          memory[dest] = (val1 < val2) ? 1 : 0;
          pointer += 4;
          break;

        case 8: // equals
          final val1 = _getParameter(1);
          final val2 = _getParameter(2);
          final dest = _getParameter(3, ParameterMode.immediate);

          memory[dest] = (val1 == val2) ? 1 : 0;
          pointer += 4;
          break;

        case 99: // halt
          _running = false;
          break;

        default:
          throw Exception("Something went wrong! Opcode: $opCode");
      }
    }

    return inputInstructions == null ? memory[0] : output.last;
  }

  void restart() {
    memory = List<int>.from(program);
    pointer = 0;
    output = [];
    _running = true;
  }

  void _substituteMemory(Map<int, int> subs) {
    for (final sub in subs.entries) {
      memory[sub.key] = sub.value;
    }
  }

  List<int> _getOpCodeParams() {
    final opCodeParams = "${memory[pointer]}".padLeft(5, "0");

    return [
      int.parse(opCodeParams.substring(3)),
      int.parse(opCodeParams[2]),
      int.parse(opCodeParams[1]),
      int.parse(opCodeParams[0]),
    ];
  }

  int _getParameter(int position, [ParameterMode parameterMode]) {
    final opCodeParams = _getOpCodeParams();
    parameterMode ??= ParameterMode.values[opCodeParams[position]];

    final value = memory[pointer + position];

    switch (parameterMode) {
      case ParameterMode.position:
        return memory[value];
      case ParameterMode.immediate:
        return value;
      default:
        throw Exception("Parameter mode $parameterMode is not supported!");
    }
  }

  static List<int> parseProgram(String program) {
    return program.trim().split(",").map(int.parse).toList();
  }

  @override
  String toString() => "IntcodeComputer(running: $running)";
}

/// Parameter mode for [IntcodeComputer].
enum ParameterMode {
  /// Parameter is interpreted as a position.
  ///
  /// If the parameter is `50`, its value is the value stored at address `50`
  /// in memory.
  position,

  /// Parameter is interpreted as a value.
  ///
  /// If the parameter is 50, its value is simply 50.
  immediate,
}
