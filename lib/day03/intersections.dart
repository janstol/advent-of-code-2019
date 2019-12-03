import 'dart:math';

Map<Point<int>, int> findIntersections(
  List<String> wire1,
  List<String> wire2,
) {
  final points = <Point<int>, int>{};
  final intersections = <Point<int>, int>{};

  int distance = 0;
  Point<int> position = const Point(0, 0);

  for (final instruction in wire1) {
    final _move = _moves[instruction.substring(0, 1)];
    final _distance = int.parse(instruction.substring(1));

    for (int i = 0; i < _distance; i++) {
      position = _move(position);
      distance++;
      if (!points.containsKey(position)) {
        points[position] = distance;
      }
    }
  }

  position = const Point(0, 0);
  distance = 0;

  for (final instruction in wire2) {
    final _move = _moves[instruction.substring(0, 1)];
    final _distance = int.parse(instruction.substring(1));

    for (int i = 0; i < _distance; i++) {
      position = _move(position);
      distance++;

      if (points.containsKey(position)) {
        intersections[position] = distance + points[position];
      }
    }
  }

  return intersections;
}

final Map<String, Point<int> Function(Point<int> point)> _moves = {
  "U": (Point<int> point) => point + const Point(0, 1),
  "R": (Point<int> point) => point + const Point(1, 0),
  "D": (Point<int> point) => point - const Point(0, 1),
  "L": (Point<int> point) => point - const Point(1, 0),
};
