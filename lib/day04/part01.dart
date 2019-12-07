import 'package:adventofcode2019/day04/password_solver.dart';

void main() {
  const rangeStart = 271973;
  const rangeEnd = 785961;

  int passwords = 0;

  for (int password = rangeStart; password <= rangeEnd; password++) {
    if (isValid("$password")) {
      passwords++;
    }
  }

  print(passwords);
}
