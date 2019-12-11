class IntcodeComputer {
  /// Program that will be loaded into [memory].
  List<int> program;

  /// Computer memory where [program] runs.
  /// Key = address.
  Map<int, int> memory;

  /// Input instructions.
  List<int> inputInstructions;

  List<int> output = [];

  /// Pointer to [memory].
  int pointer = 0;

  int relativeBase = 0;

  bool _running = true;

  /// Creates [IntcodeComputer].
  ///
  /// Provide [program] that will be loaded into [memory].
  IntcodeComputer(this.program) {
    memory = Map.from(program.asMap());
  }

  /// Indicates whether computer is running or not (halt).
  bool get running => _running;

  int run({
    Map<int, int> subs = const {},
    List<int> inputInstructions,
  }) {
    _substituteMemory(subs);

    output.clear();
    int opCode;

    while (opCode != 99) {
      final params = _getOpCodeParams();
      opCode = params[0];

      final param1 = _getParameter(1, ParameterMode.immediate);
      // final param2 = _getParameter(2, ParameterMode.immediate);
      final param3 = _getParameter(3, ParameterMode.immediate);

      final param1Val = _getParameter(1);
      final param2Val = _getParameter(2);
      // final param3Val = _getParameter(3);

      final param1Pos = params[1] == 2 ? param1 + relativeBase : param1;
      // final param2Pos = params[2] == 2 ? param2 + relativeBase : param2;
      final param3Pos = params[3] == 2 ? param3 + relativeBase : param3;

      switch (opCode) {
        case 1: // add
          memory[param3Pos] = param1Val + param2Val;
          pointer += 4;
          break;

        case 2: // multiply
          memory[param3Pos] = param1Val * param2Val;
          pointer += 4;
          break;

        case 3: // input
          if (inputInstructions.isEmpty) return null;

          memory[param1Pos] = inputInstructions.removeAt(0);
          pointer += 2;
          break;

        case 4: // output
          output.add(param1Val);
          pointer += 2;
          break;

        case 5: // jump-if-true
          pointer = param1Val != 0 ? param2Val : pointer + 3;
          break;

        case 6: // jump-if-false
          pointer = param1Val == 0 ? param2Val : pointer + 3;
          break;

        case 7: // less than
          memory[param3Pos] = (param1Val < param2Val) ? 1 : 0;
          pointer += 4;
          break;

        case 8: // equals
          memory[param3Pos] = (param1Val == param2Val) ? 1 : 0;
          pointer += 4;
          break;

        case 9: // adjusts the relative base
          relativeBase += param1Val;
          pointer += 2;
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
    memory = Map<int, int>.from(program.asMap());
    pointer = 0;
    relativeBase = 0;
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
      int.parse(opCodeParams.substring(3)), //DE
      int.parse(opCodeParams[2]), // C
      int.parse(opCodeParams[1]), // B
      int.parse(opCodeParams[0]), // A
    ];
  }

  int _getParameter(int position, [ParameterMode parameterMode]) {
    final opCodeParams = _getOpCodeParams();
    parameterMode ??= ParameterMode.values[opCodeParams[position]];

    final value = memory[pointer + position] ?? 0;

    switch (parameterMode) {
      case ParameterMode.position:
        return memory[value] ?? 0;
      case ParameterMode.immediate:
        return value;
      case ParameterMode.relative:
        return memory[value + relativeBase] ?? 0;
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

  /// Relative mode parameters don't count from address 0.
  /// Instead, they count from a value called the relative base.
  /// The relative base starts at 0.
  relative,
}
