int fft(List<int> input, int phases) {
  final temp = <int>[];
  final output = List.of(input);

  for (int phase = 0; phase < phases; phase++) {
    temp
      ..clear()
      ..addAll(output);
    output.clear();

    for (int i = 0; i < input.length; i++) {
      final pattern = _generatePattern(i + 1).toList();
      int out = 0;

      for (int j = 0; j < input.length; j++) {
        out += temp[j] * pattern[(j + 1) % pattern.length];
      }

      output.add(out.abs() % 10);
    }
  }

  return int.parse(output.take(8).join());
}

int fft2(List<int> input, int phases, int inputRepeat) {
  final offset = int.parse(input.take(7).join());
  final output = <int>[];

  for (int step = 0; step < inputRepeat; step++) {
    output.addAll(input);
  }

  for (int i = 0; i < phases; i++) {
    for (int j = output.length - 2; j > offset - 1; j--) {
      output[j] += output[j + 1];
      output[j] %= 10;
    }
  }

  return int.parse(output.skip(offset).take(8).join());
}

Iterable<int> _generatePattern(int step) sync* {
  yield* _basePattern.expand((el) => List<int>.generate(step, (_) => el));
}

const _basePattern = [0, 1, 0, -1];
