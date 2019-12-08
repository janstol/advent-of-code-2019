import 'package:adventofcode2019/day04/day04.dart';
import 'package:adventofcode2019/day04/password_solver.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Test inputs", () {
      expect(isValidPassword("111111"), true);
      expect(isValidPassword("223450"), false);
      expect(isValidPassword("123789"), false);
    });

    test("Solution test", () {
      final day = Day04("271973-785961");
      expect(day.solvePart01(), 925);
    });
  });

  group("Part 02", () {
    test("Test inputs", () {
      expect(isValidPassword2("112233"), true);
      expect(isValidPassword2("123444"), false);
      expect(isValidPassword2("111122"), true);
    });

    test("Solution test", () {
      final day = Day04("271973-785961");
      expect(day.solvePart02(), 607);
    });
  });
}
