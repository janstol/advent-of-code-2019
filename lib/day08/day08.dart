import 'package:adventofcode2019/common/day.dart';
import 'package:adventofcode2019/day08/space_image.dart';

class Day08 extends Day<String, int, String> {
  Day08(String input) : super(input);

  @override
  String parseInput(String input) => input;

  @override
  int solvePart01() {
    final img = SpaceImage(input: input, width: 25, height: 6);

    final layer0 = img.layers
        .where((l) => l.countDigits(0) > 0)
        .reduce((a, b) => a.countDigits(0) < b.countDigits(0) ? a : b);

    final ones = img.layers[layer0.index].countDigits(1);
    final twos = img.layers[layer0.index].countDigits(2);

    return ones * twos;
  }

  @override
  String solvePart02() {
    final img = SpaceImage(input: input, width: 25, height: 6);
    return img.toString();
  }
}
