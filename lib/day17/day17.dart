import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/common/intcode_computer.dart';
import 'package:adventofcode2019/day17/ascii.dart';

class Day17 extends Day<List<int>, int, int> {
  Day17(String input) : super(input);

  @override
  List<int> parseInput(String input) => IntcodeComputer.parseProgram(input);

  @override
  int solvePart01() {
    final ascii = ASCII(input)..processCameraImage();
    print(ascii.cameraImage);
    return ascii
        .findIntersections()
        .map((p) => p.x * p.y)
        .reduce((a, b) => a + b)
        .toInt();
  }

  @override
  int solvePart02() {
    // For me, it was easier to solve this part by hand...

    // R6, L10, R8, R8, R12, L8, L8, R6, L10, R8, R8, R12, L8, L8, L10, R6, R6,
    // L8, R6, L10, R8, R8, R12, L8, L8, L10, R6, R6, L8, R6, L10, R8, L10, R6,
    // R6, L8

    // Main routine: ABABCABCAC
    // Function A: R6, L10, R8
    // Function B: R8, R12, L8, L8
    // Function C: L10, R6, R6, L8

    final mainRoutine = List.of("A,B,A,B,C,A,B,C,A,C\n".codeUnits);
    final functionA = List.of("R,6,L,10,R,8\n".codeUnits);
    final functionB = List.of("R,8,R,12,L,8,L,8\n".codeUnits);
    final functionC = List.of("L,10,R,6,R,6,L,8\n".codeUnits);
    final videoFeed = List.of("n\n".codeUnits);

    final instructions = <int>[
      ...mainRoutine,
      ...functionA,
      ...functionB,
      ...functionC,
      ...videoFeed
    ];

    return IntcodeComputer(input).run(
      subs: {0: 2},
      inputInstructions: instructions,
    );
  }
}
