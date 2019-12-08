import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/day04/password_solver.dart';

class Day04 extends Day<List<int>, int, int> {
  Day04(String input) : super(input, rawInput: true);

  @override
  List<int> parseInput(String input) =>
      input.split("-").map(int.parse).toList();

  @override
  int solvePart01() {
    int passwords = 0;

    for (int password = input[0]; password <= input[1]; password++) {
      if (isValidPassword("$password")) {
        passwords++;
      }
    }

    return passwords;
  }

  @override
  int solvePart02() {
    int passwords = 0;

    for (int password = input[0]; password <= input[1]; password++) {
      if (isValidPassword2("$password")) {
        passwords++;
      }
    }

    return passwords;
  }
}
