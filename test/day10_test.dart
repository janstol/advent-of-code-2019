import 'package:adventofcode2019/day10/asteroid_map.dart';
import 'package:adventofcode2019/day10/day10.dart';
import 'package:test/test.dart';

void main() {
  group("Part 01", () {
    test("Test 01", () {
      const rawMap = ".#..#\n"
          ".....\n"
          "#####\n"
          "....#\n"
          "...##";
      expect(
        AsteroidMap(rawMap).findBestAsteroid(),
        Asteroid(3, 4)..visibleAsteroids = 8,
      );
    });

    test("Test 02", () {
      const rawMap = "......#.#.\n"
          "#..#.#....\n"
          "..#######.\n"
          ".#.#.###..\n"
          ".#..#.....\n"
          "..#....#.#\n"
          "#..#....#.\n"
          ".##.#..###\n"
          "##...#..#.\n"
          ".#....####";

      expect(
        AsteroidMap(rawMap).findBestAsteroid(),
        Asteroid(5, 8)..visibleAsteroids = 33,
      );
    });

    test("Test 03", () {
      const rawMap = "#.#...#.#.\n"
          ".###....#.\n"
          ".#....#...\n"
          "##.#.#.#.#\n"
          "....#.#.#.\n"
          ".##..###.#\n"
          "..#...##..\n"
          "..##....##\n"
          "......#...\n"
          ".####.###.";

      expect(
        AsteroidMap(rawMap).findBestAsteroid(),
        Asteroid(1, 2)..visibleAsteroids = 35,
      );
    });

    test("Test 04", () {
      const rawMap = ".#..#..###\n"
          "####.###.#\n"
          "....###.#.\n"
          "..###.##.#\n"
          "##.##.#.#.\n"
          "....###..#\n"
          "..#.#..#.#\n"
          "#..#.#.###\n"
          ".##...##.#\n"
          ".....#.#..";

      expect(
        AsteroidMap(rawMap).findBestAsteroid(),
        Asteroid(6, 3)..visibleAsteroids = 41,
      );
    });

    test("Test 05", () {
      const rawMap = ".#..##.###...#######\n"
          "##.############..##.\n"
          ".#.######.########.#\n"
          ".###.#######.####.#.\n"
          "#####.##.#.##.###.##\n"
          "..#####..#.#########\n"
          "####################\n"
          "#.####....###.#.#.##\n"
          "##.#################\n"
          "#####.##.###..####..\n"
          "..######..##.#######\n"
          "####.##.####...##..#\n"
          ".#####..#.######.###\n"
          "##...#.##########...\n"
          "#.##########.#######\n"
          ".####.#.###.###.#.##\n"
          "....##.##.###..#####\n"
          ".#.#.###########.###\n"
          "#.#.#.#####.####.###\n"
          "###.##.####.##.#..##";

      expect(
        AsteroidMap(rawMap).findBestAsteroid(),
        Asteroid(11, 13)..visibleAsteroids = 210,
      );
    });

    test("Solution test", () {
      final day = Day10("lib/day10/input.txt");
      expect(day.solvePart01(), Asteroid(22, 28)..visibleAsteroids = 326);
    });
  });

  group("Part 02", () {
    test("Test 01", () {
      const rawMap = ".#..##.###...#######\n"
          "##.############..##.\n"
          ".#.######.########.#\n"
          ".###.#######.####.#.\n"
          "#####.##.#.##.###.##\n"
          "..#####..#.#########\n"
          "####################\n"
          "#.####....###.#.#.##\n"
          "##.#################\n"
          "#####.##.###..####..\n"
          "..######..##.#######\n"
          "####.##.####...##..#\n"
          ".#####..#.######.###\n"
          "##...#.##########...\n"
          "#.##########.#######\n"
          ".####.#.###.###.#.##\n"
          "....##.##.###..#####\n"
          ".#.#.###########.###\n"
          "#.#.#.#####.####.###\n"
          "###.##.####.##.#..##";

      final map = AsteroidMap(rawMap);
      final station = map.findBestAsteroid();
      final a1 = map.getNthVaporizedAsteroid(station, 1);
      final a10 = map.getNthVaporizedAsteroid(station, 10);
      final a100 = map.getNthVaporizedAsteroid(station, 100);
      final a199 = map.getNthVaporizedAsteroid(station, 199);
      final a200 = map.getNthVaporizedAsteroid(station, 200);
      final a201 = map.getNthVaporizedAsteroid(station, 201);

      expect(a1.x * 100 + a1.y, 1112);
      expect(a10.x * 100 + a10.y, 1208);
      expect(a100.x * 100 + a100.y, 1016);
      expect(a199.x * 100 + a199.y, 906);
      expect(a200.x * 100 + a200.y, 802);
      expect(a201.x * 100 + a201.y, 1009);
    });

    test("Solution test", () {
      final day = Day10("lib/day10/input.txt");
      expect(day.solvePart02(), 1623);
    });
  });
}
