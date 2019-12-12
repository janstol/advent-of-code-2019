import 'dart:math';

import 'package:adventofcode2019/common/extensions.dart';

class Moon {
  final int id;
  Vec3D position;
  Vec3D velocity;

  Moon.fromInput(String input) : id = Random(input.hashCode).nextInt(1000) {
    final r = RegExp(r"\<x=(?<x>\-?\d+),\s?y=(?<y>\-?\d+),\s?z=(?<z>\-?\d+)\>");
    final match = r.firstMatch(input);

    position = Vec3D(
      int.parse(match.namedGroup("x")),
      int.parse(match.namedGroup("y")),
      int.parse(match.namedGroup("z")),
    );
    velocity = const Vec3D.zero();
  }

  int get energy => position.sum * velocity.sum;

  void applyGravity(Moon other) {
    velocity += Vec3D(
      other.position.x.compareTo(position.x),
      other.position.y.compareTo(position.y),
      other.position.z.compareTo(position.z),
    );

    other.velocity += Vec3D(
      position.x.compareTo(other.position.x),
      position.y.compareTo(other.position.y),
      position.z.compareTo(other.position.z),
    );
  }

  void applyVelocity() {
    position += velocity;
  }

  @override
  int get hashCode => id.hashCode ^ position.hashCode ^ velocity.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Moon &&
            id == other.id &&
            position == other.position &&
            velocity == other.velocity;
  }

  @override
  String toString() =>
      "pos=<x=${position.x}, y=${position.y}, z=${position.z}>, "
      "vel=<x=${velocity.x}, y=${velocity.y}, z=${velocity.z}>";
}

class Vec3D {
  final int x;
  final int y;
  final int z;

  const Vec3D(this.x, this.y, this.z);

  const Vec3D.zero() : this(0, 0, 0);

  @override
  String toString() => "Vec3D($x, $y, $z)";

  int get sum => x.abs() + y.abs() + z.abs();

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ z.hashCode;

  Vec3D operator +(Vec3D other) {
    return Vec3D(x + other.x, y + other.y, z + other.z);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Vec3D && x == other.x && y == other.y && z == other.z;
  }
}

void simulate(List<Moon> moons) {
  for (int i = 0; i < moons.length; i++) {
    for (int j = i + 1; j < moons.length; j++) {
      moons[i].applyGravity(moons[j]);
    }
  }

  for (final moon in moons) {
    moon.applyVelocity();
  }
}

int stepsToFirstState(List<Moon> moons) {
  final x = _findStep(moons.map((m) => m.position.x).toList());
  final y = _findStep(moons.map((m) => m.position.y).toList());
  final z = _findStep(moons.map((m) => m.position.z).toList());

  return x.lcm(y.lcm(z));
}

int _findStep(List<int> pos) {
  final velocity = List.filled(pos.length, 0);
  final initial = pos.toString();
  int steps = 1;

  do {
    for (int i = 0; i < pos.length; i++) {
      for (int j = i + 1; j < pos.length; j++) {
        velocity[i] += pos[j].compareTo(pos[i]);
        velocity[j] += pos[i].compareTo(pos[j]);
      }
    }
    for (int i = 0; i < pos.length; i++) {
      pos[i] += velocity[i];
    }
    steps++;
  } while (pos.toString() != initial);

  return steps;
}
