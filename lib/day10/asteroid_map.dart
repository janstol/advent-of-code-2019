import 'dart:math';

class AsteroidMap {
  final List<Asteroid> asteroids = [];

  AsteroidMap(String rawMap) {
    _parseMap(rawMap);
  }

  /// Finds best asteroid for Monitoring Station.
  Asteroid findBestAsteroid() {
    Asteroid best;
    int max = 0;
    for (final asteroid in asteroids) {
      final visibleAsteroidsCount = asteroid.getVisibleAsteroidsCount(
        asteroids.where((a) => a != asteroid).toList(),
      );
      asteroid.visibleAsteroids = visibleAsteroidsCount;

      if (asteroid.visibleAsteroids > max) {
        max = asteroid.visibleAsteroids;
        best = asteroid;
      }
    }

    return best;
  }

  /// Returns [n]th vaporized [Asteroid].
  Asteroid getNthVaporizedAsteroid(Asteroid station, int n) {
    Asteroid nth;

    final directions =
        station.getDirections(asteroids.where((a) => a != station).toList());

    for (final e in directions.entries) {
      e.value.sort(
        (a, b) => a.distanceTo(station).compareTo(b.distanceTo(station)),
      );
    }

    final res = directions.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    int count = 0;
    int index = 0;
    int i;

    while (count < n) {
      i = index % res.length;
      final value = res[i].value;

      if (value.isNotEmpty) {
        nth = value.removeAt(0);
        count++;
      }

      index++;
    }

    return nth;
  }

  void _parseMap(String rawMap) {
    int y = 0;
    int x = 0;

    for (int i = 0; i < rawMap.length; i++) {
      final obj = rawMap[i];

      if (obj == "\n") {
        y++;
        x = 0;
        continue;
      }

      if (obj == "#") {
        asteroids.add(Asteroid(x, y));
      }

      x++;
    }
  }
}

class Asteroid {
  final int x;
  final int y;
  int visibleAsteroids = 0;

  Asteroid(this.x, this.y);

  int getVisibleAsteroidsCount(List<Asteroid> asteroids) {
    return asteroids.map((a) => atan2(a.y - y, a.x - x)).toSet().length;
  }

  Map<double, List<Asteroid>> getDirections(List<Asteroid> asteroids) {
    final map = <double, List<Asteroid>>{};

    for (final asteroid in asteroids) {
      final angle = atan2(asteroid.x - x, asteroid.y - y) * 180 / pi;
      if (map[angle] == null) {
        map[angle] = [];
      }
      map[angle].add(asteroid);
    }

    return map;
  }

  /// Distance from this to [other] asteroid position.
  double distanceTo(Asteroid other) {
    final dx = x - other.x;
    final dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  @override
  String toString() => "A($x,$y, $visibleAsteroids)";

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ visibleAsteroids.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Asteroid &&
            x == other.x &&
            y == other.y &&
            visibleAsteroids == other.visibleAsteroids;
  }
}
