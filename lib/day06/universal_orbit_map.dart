class UniversalOrbitMap {
  final List<List<String>> _rawMap;
  final SpaceObject map;

  UniversalOrbitMap(this._rawMap)
      : map = SpaceObject(name: "COM", parent: null) {
    map.orbits.addAll(_findOrbits(map));
  }

  int get totalOrbits => map.orbitsCount;

  int getOrbitalTransfersCount(String o1, String o2) {
    final parents1 = map.find(o1)?.parents ?? [];
    final parents2 = map.find(o2)?.parents ?? [];

    for (int i = 0; i < parents2.length; i++) {
      if (parents1[i] != parents2[i]) {
        return parents1.length - 1 - i + parents2.length - 1 - i;
      }
    }

    return null;
  }

  List<SpaceObject> _findOrbits(SpaceObject root) {
    final objects = _rawMap
        .where((o) => o[0] == root.name)
        .map((o) => SpaceObject(name: o[1], parent: root))
        .toList();

    for (final o in objects) {
      o.orbits.addAll(_findOrbits(o));
    }

    return objects;
  }
}

class SpaceObject {
  final String name;
  final List<SpaceObject> orbits = [];
  final SpaceObject parent;
  final int parentCount;

  SpaceObject({this.name, this.parent})
      : parentCount = parent == null ? 0 : parent.parentCount + 1;

  int get orbitsCount => orbits.isEmpty
      ? parentCount
      : parentCount + orbits.map((o) => o.orbitsCount).reduce((a, b) => a + b);

  List<SpaceObject> get parents =>
      parent == null ? [this] : [...parent.parents, this];

  /// Find [SpaceObject] in descendants.
  SpaceObject find(String name) {
    return this.name == name
        ? this
        : orbits
            .map((o) => o.find(name))
            .firstWhere((o) => o != null, orElse: () => null);
  }

  @override
  int get hashCode =>
      name.hashCode ^
      parent.hashCode ^
      parentCount.hashCode ^
      orbits.toString().hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is SpaceObject &&
            name == other.name &&
            parent == other.parent &&
            parentCount == other.parentCount &&
            orbits.toString() == other.orbits.toString();
  }

  @override
  String toString() => "SpaceObject($name, ${parent?.name}, $orbits)";
}
