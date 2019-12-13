import 'package:adventofcode2019/common/intcode_computer.dart';

class Arcade {
  final IntcodeComputer computer;
  final List<Tile> tiles = [];
  final int insertedQuarters;
  final Map<int, int> _memorySubs;
  int score = 0;

  Arcade({List<int> program, this.insertedQuarters})
      : computer = IntcodeComputer(program),
        _memorySubs = (insertedQuarters != null) ? {0: insertedQuarters} : {};

  Tile get ball => tiles.singleWhere((t) => t.type == TileType.ball);

  Tile get paddle => tiles.singleWhere((t) => t.type == TileType.paddle);

  void start() {
    computer.run(subs: _memorySubs, inputInstructions: []);
    _parseComputerOutput(computer.output);

    while (computer.running) {
      computer.run(
        subs: _memorySubs,
        inputInstructions: [ball.x.compareTo(paddle.x)],
      );
      _parseComputerOutput(computer.output);
    }
  }

  void display() {
    final sb = StringBuffer();
    sb.writeln();

    for (final tile in tiles) {
      sb.write(tile.display());

      if (tile.x > 0 && tile.x % 36 == 0) {
        sb.writeln();
      }
    }

    print(sb);
  }

  void _parseComputerOutput(List<int> output) {
    for (int i = 0; i < output.length; i += 3) {
      final x = output[i];
      final y = output[i + 1];
      final type = output[i + 2];

      if (x == -1 && y == 0) {
        score = type;
      } else {
        final tile = Tile(x, y, TileType.values[type]);
        final index = tiles.indexWhere((t) => t.x == x && t.y == y);

        (index != -1) ? tiles[index] = tile : tiles.add(tile);
      }
    }
  }
}

class Tile {
  final int x;
  final int y;
  final TileType type;

  const Tile(this.x, this.y, this.type);

  String display() {
    switch (type) {
      case TileType.wall:
        return "#";
      case TileType.block:
        return "X";
      case TileType.paddle:
        return "_";
      case TileType.ball:
        return "o";
      default:
        return " "; // empty tile
    }
  }

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ type.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Tile && x == other.x && y == other.y && type == other.type;
  }
}

enum TileType { empty, wall, block, paddle, ball }
