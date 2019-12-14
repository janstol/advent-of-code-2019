import 'dart:math';

class Nanofactory {
  final Map<String, Chemical> chemicals = {};
  final Map<Chemical, int> chemicalsLeft = {};

  Nanofactory(String reactions) {
    _parse(reactions.split("\n"));
  }

  int produce(String chemicalName, int quantity) {
    if (chemicalName == "ORE") {
      return quantity;
    }

    final chem = chemicals[chemicalName];

    int ore = 0;
    final needed = min(quantity, chemicalsLeft[chem] ??= 0);
    final realQuantity = quantity - needed;
    chemicalsLeft[chem] -= needed;

    final prod = chem.quantity;
    final reactions = (realQuantity / prod).ceil();

    for (final c in chem.requirements) {
      ore += produce(c.name, reactions * c.quantity);
    }

    chemicalsLeft[chem] += reactions * prod - realQuantity;

    return ore;
  }

  int fuelProducedFromOre(int oreQuantity) {
    final oneFuelOre = produce("FUEL", 1);

    int oreLeft = oreQuantity;
    int fuelToProduce = oreQuantity ~/ oneFuelOre;
    int fuelProduced = 0;
    int ore = 0;

    while (oreLeft > 0 && fuelToProduce > 1) {
      ore = produce("FUEL", fuelToProduce);

      if (oreLeft > ore) {
        oreLeft -= ore;
        fuelProduced += fuelToProduce;
      } else {
        fuelToProduce =
            fuelToProduce < 10 ? fuelToProduce - 1 : fuelToProduce ~/ 2;
      }
    }

    return fuelProduced;
  }

  void _parse(List<String> input) {
    for (final reaction in input) {
      final parts = reaction.split('=>');

      final chems = parts.expand((p) => p.trim().split(",")).map((p) {
        final s = p.trim().split(" ");
        return Chemical(name: s[1], quantity: int.parse(s[0]));
      }).toList();

      final chem = chems.last;
      chem.requirements.addAll(chems.take(chems.length - 1));
      chemicals[chem.name] = chem;
    }
  }
}

class Chemical {
  final String name;
  final int quantity;
  final List<Chemical> requirements = [];

  Chemical({this.name, this.quantity});

  @override
  String toString() => requirements.isEmpty
      ? "$quantity $name"
      : "$requirements => $quantity $name";

  @override
  int get hashCode => name.hashCode ^ quantity.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Chemical && name == other.name && quantity == other.quantity;
  }
}
