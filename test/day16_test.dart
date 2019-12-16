import 'package:adventofcode2019/day16/day16.dart';
import 'package:adventofcode2019/day16/fft.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Test 001", () {
      final input = "12345678".split("").map(int.parse).toList();

      expect(fft(input, 1), 48226158);
      expect(fft(input, 2), 34040438);
      expect(fft(input, 3), 03415518);
      expect(fft(input, 4), 01029498);
    });

    test("Test 02", () {
      final input =
          "80871224585914546619083218645595".split("").map(int.parse).toList();
      expect(fft(input, 100), 24176176);
    });

    test("Test 03", () {
      final input =
          "19617804207202209144916044189917".split("").map(int.parse).toList();
      expect(fft(input, 100), 73745418);
    });

    test("Test 04", () {
      final input =
          "69317163492948606335995924319873".split("").map(int.parse).toList();
      expect(fft(input, 100), 52432133);
    });

    test("Solution test", () {
      final day = Day16("lib/day16/input.txt");
      expect(day.solvePart01(), 84487724);
    });
  });

  group("Part 02", () {
    test("Test 01", () {
      final input =
          "03036732577212944063491565474664".split("").map(int.parse).toList();

      expect(fft2(input, 100, 10000), 84462026);
    });

    test("Test 02", () {
      final input =
          "02935109699940807407585447034323".split("").map(int.parse).toList();

      expect(fft2(input, 100, 10000), 78725270);
    });

    test("Test 03", () {
      final input =
          "03081770884921959731165446850517".split("").map(int.parse).toList();

      expect(fft2(input, 100, 10000), 53553731);
    });

    test("Solution test", () {
      final day = Day16("lib/day16/input.txt");
      expect(day.solvePart02(), 84692524);
    });
  });
}
