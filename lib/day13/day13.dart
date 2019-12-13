import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/common/intcode_computer.dart';
import 'package:adventofcode2019/day13/arcade.dart';

class Day13 extends Day<List<int>, int, int> {
  Day13(String input) : super(input);

  @override
  List<int> parseInput(String input) => IntcodeComputer.parseProgram(input);

  @override
  int solvePart01() {
    final game = Arcade(program: input)..start();
    return game.tiles.where((t) => t.type == TileType.block).length;
  }

  @override
  int solvePart02() {
    final game = Arcade(program: input, insertedQuarters: 2)..start();
    return game.score;
  }
}
