import 'package:adventofcode2019/day12/day12.dart';
import 'package:adventofcode2019/day12/moon.dart';
import 'package:test/test.dart';

void main() {
  const input1 = "<x=-1, y=0, z=2>\n"
      "<x=2, y=-10, z=-7>\n"
      "<x=4, y=-8, z=8>\n"
      "<x=3, y=5, z=-1>";

  const input2 = "<x=-8, y=-10, z=0>\n"
      "<x=5, y=5, z=10>\n"
      "<x=2, y=-7, z=3>\n"
      "<x=9, y=-8, z=-3>";

  group("Part 01", () {
    test("Test 01", () {
      final moons = input1.split("\n").map((m) => Moon.fromInput(m)).toList();

      for (int step = 0; step < 10; step++) {
        simulate(moons);
      }

      expect(moons[0].position, const Vec3D(2, 1, -3));
      expect(moons[0].velocity, const Vec3D(-3, -2, 1));

      expect(moons[1].position, const Vec3D(1, -8, 0));
      expect(moons[1].velocity, const Vec3D(-1, 1, 3));

      expect(moons[2].position, const Vec3D(3, -6, 1));
      expect(moons[2].velocity, const Vec3D(3, 2, -3));

      expect(moons[3].position, const Vec3D(2, 0, 4));
      expect(moons[3].velocity, const Vec3D(1, -1, -1));

      expect(moons.map((m) => m.energy).reduce((a, b) => a + b), 179);
    });

    test("Test 02", () {
      final moons = input2.split("\n").map((m) => Moon.fromInput(m)).toList();

      for (int step = 0; step < 100; step++) {
        simulate(moons);
      }

      expect(moons[0].position, const Vec3D(8, -12, -9));
      expect(moons[0].velocity, const Vec3D(-7, 3, 0));

      expect(moons[1].position, const Vec3D(13, 16, -3));
      expect(moons[1].velocity, const Vec3D(3, -11, -5));

      expect(moons[2].position, const Vec3D(-29, -11, -1));
      expect(moons[2].velocity, const Vec3D(-3, 7, 4));

      expect(moons[3].position, const Vec3D(16, -13, 23));
      expect(moons[3].velocity, const Vec3D(7, 1, 1));

      expect(moons.map((m) => m.energy).reduce((a, b) => a + b), 1940);
    });

    test("Solution test", () {
      final day = Day12("lib/day12/input.txt");
      expect(day.solvePart01(), 12466);
    });
  });

  group("Part 02", () {
    test("Test 01", () {
      final moons = input1.split("\n").map((m) => Moon.fromInput(m)).toList();
      final original =
          input1.split("\n").map((m) => Moon.fromInput(m)).toList();

      int steps = 0;

      do {
        simulate(moons);
        steps++;
      } while (!(moons[0] == original[0] &&
          moons[1] == original[1] &&
          moons[2] == original[2] &&
          moons[3] == original[3]));

      expect(steps, 2772);
      expect(stepsToFirstState(moons), 2772);
    });

    test("Test 02", () {
      final moons = input2.split("\n").map((m) => Moon.fromInput(m)).toList();
      expect(stepsToFirstState(moons), 4686774924);
    });

    test("Solution test", () {
      final day = Day12("lib/day12/input.txt");
      expect(day.solvePart02(), 360689156787864);
    });
  });
}
