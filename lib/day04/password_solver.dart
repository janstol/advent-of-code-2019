/// For part 1
bool isValidPassword(String password) {
  final pass = password.split("").map(int.parse).toList();
  int lastNumber = -1;
  bool foundSameAdjacents = false;

  for (final number in pass) {
    if (number < lastNumber) {
      return false;
    }

    if (number == lastNumber) {
      foundSameAdjacents = true;
    }

    lastNumber = number;
  }

  return foundSameAdjacents == true;
}

/// For part 2
bool isValidPassword2(String password) {
  final pass = password.split("").map(int.parse).toList();
  int lastNumber = -1;
  bool foundSameAdjacents = false;
  int adjacentsCount = 0;

  for (final number in pass) {
    if (number < lastNumber) {
      return false;
    }

    if (number == lastNumber) {
      adjacentsCount++;
    } else {
      if (adjacentsCount == 1) {
        foundSameAdjacents = true;
      }
      adjacentsCount = 0;
    }

    lastNumber = number;
  }

  return foundSameAdjacents == true || adjacentsCount == 1;
}
