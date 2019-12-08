Iterable<List<int>> permutate(Iterable<int> inputs) sync* {
  if (inputs.length == 1) {
    yield inputs.toList();
  } else {
    for (final input in inputs) {
      for (final perm in permutate(inputs.where((x) => x != input))) {
        yield [input, ...perm];
      }
    }
  }
}
