import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/day16/fft.dart';

class Day16 extends Day<List<int>, int, int> {
  Day16(String input) : super(input);

  @override
  List<int> parseInput(String input) => input.split("").map(int.parse).toList();

  @override
  int solvePart01() => fft(input, 100);

  @override
  int solvePart02() => fft2(input, 100, 10000);
}
