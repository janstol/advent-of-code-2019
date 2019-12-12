extension IntExt on int {
  int lcm(int other) => (this * other) ~/ gcd(other);
}

extension IterableExt<T> on Iterable<T> {
  Iterable<List<T>> permutate() sync* {
    if (length == 1) {
      yield toList();
    } else {
      for (final input in this) {
        for (final perm in where((x) => x != input).permutate()) {
          yield [input, ...perm];
        }
      }
    }
  }
}
