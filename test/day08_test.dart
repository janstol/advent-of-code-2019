import 'package:adventofcode2019/day08/day08.dart';
import 'package:adventofcode2019/day08/space_image.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Test 01", () {
      final img = SpaceImage(input: "123456789012", width: 3, height: 2);

      final layer0 = img.layers
          .where((l) => l.countDigits(0) > 0)
          .reduce((a, b) => a.countDigits(0) < b.countDigits(0) ? a : b);

      final ones = img.layers[layer0.index].countDigits(1);
      final twos = img.layers[layer0.index].countDigits(2);

      expect(ones * twos, 1);
    });

    test("Solution test", () {
      final day = Day08("lib/day08/input.txt");
      expect(day.solvePart01(), 1905);
    });
  });

  group("Part 02", () {
    test("Test 01", () {
      final img = SpaceImage(input: "0222112222120000", width: 2, height: 2);
      expect(img.decode(), [0, 1, 1, 0]);
      expect(img.toString(), "\n.#\n#.");
    });

    test("Solution test", () {
      final day = Day08("lib/day08/input.txt");
      const output = "\n.##...##..#..#.###..####.\n"
          "#..#.#..#.#.#..#..#....#.\n"
          "#..#.#....##...#..#...#..\n"
          "####.#....#.#..###...#...\n"
          "#..#.#..#.#.#..#....#....\n"
          "#..#..##..#..#.#....####.";

      expect(day.solvePart02(), output);
    });
  });
}
