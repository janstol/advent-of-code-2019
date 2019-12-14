import 'package:adventofcode2019/day14/day14.dart';
import 'package:adventofcode2019/day14/nanofactory.dart';
import 'package:test/test.dart';

void main() {
  const t1 = "10 ORE => 10 A\n"
      "1 ORE => 1 B\n"
      "7 A, 1 B => 1 C\n"
      "7 A, 1 C => 1 D\n"
      "7 A, 1 D => 1 E\n"
      "7 A, 1 E => 1 FUEL";

  const t2 = "9 ORE => 2 A\n"
      "8 ORE => 3 B\n"
      "7 ORE => 5 C\n"
      "3 A, 4 B => 1 AB\n"
      "5 B, 7 C => 1 BC\n"
      "4 C, 1 A => 1 CA\n"
      "2 AB, 3 BC, 4 CA => 1 FUEL";

  const t3 = "157 ORE => 5 NZVS\n"
      "165 ORE => 6 DCFZ\n"
      "44 XJWVT, 5 KHKGT, 1 QDVJ, 29 NZVS, 9 GPVTF, 48 HKGWZ => 1 FUEL\n"
      "12 HKGWZ, 1 GPVTF, 8 PSHF => 9 QDVJ\n"
      "179 ORE => 7 PSHF\n"
      "177 ORE => 5 HKGWZ\n"
      "7 DCFZ, 7 PSHF => 2 XJWVT\n"
      "165 ORE => 2 GPVTF\n"
      "3 DCFZ, 7 NZVS, 5 HKGWZ, 10 PSHF => 8 KHKGT";

  const t4 = "2 VPVL, 7 FWMGM, 2 CXFTF, 11 MNCFX => 1 STKFG\n"
      "17 NVRVD, 3 JNWZP => 8 VPVL\n"
      "53 STKFG, 6 MNCFX, 46 VJHF, 81 HVMC, 68 CXFTF, 25 GNMV => 1 FUEL\n"
      "22 VJHF, 37 MNCFX => 5 FWMGM\n"
      "139 ORE => 4 NVRVD\n"
      "144 ORE => 7 JNWZP\n"
      "5 MNCFX, 7 RFSQX, 2 FWMGM, 2 VPVL, 19 CXFTF => 3 HVMC\n"
      "5 VJHF, 7 MNCFX, 9 VPVL, 37 CXFTF => 6 GNMV\n"
      "145 ORE => 6 MNCFX\n"
      "1 NVRVD => 8 CXFTF\n"
      "1 VJHF, 6 MNCFX => 4 RFSQX\n"
      "176 ORE => 6 VJHF";

  const t5 = "171 ORE => 8 CNZTR\n"
      "7 ZLQW, 3 BMBT, 9 XCVML, 26 XMNCP, 1 WPTQ, 2 MZWV, 1 RJRHP => "
      "4 PLWSL\n"
      "114 ORE => 4 BHXH\n"
      "14 VRPVC => 6 BMBT\n"
      "6 BHXH, 18 KTJDG, 12 WPTQ, 7 PLWSL, 31 FHTLT, 37 ZDVW => 1 FUEL\n"
      "6 WPTQ, 2 BMBT, 8 ZLQW, 18 KTJDG, 1 XMNCP, 6 MZWV, 1 RJRHP => "
      "6 FHTLT\n"
      "15 XDBXC, 2 LTCX, 1 VRPVC => 6 ZLQW\n"
      "13 WPTQ, 10 LTCX, 3 RJRHP, 14 XMNCP, 2 MZWV, 1 ZLQW => 1 ZDVW\n"
      "5 BMBT => 4 WPTQ\n"
      "189 ORE => 9 KTJDG\n"
      "1 MZWV, 17 XDBXC, 3 XCVML => 2 XMNCP\n"
      "12 VRPVC, 27 CNZTR => 2 XDBXC\n"
      "15 KTJDG, 12 BHXH => 5 XCVML\n"
      "3 BHXH, 2 VRPVC => 7 MZWV\n"
      "121 ORE => 7 VRPVC\n"
      "7 XCVML => 6 RJRHP\n"
      "5 BHXH, 4 VRPVC => 5 LTCX";

  final trillion = 1e12.toInt();

  group("Part 01", () {
    test("Test 01", () {
      expect(Nanofactory(t1).produce("FUEL", 1), 31);
    });

    test("Test 02", () {
      expect(Nanofactory(t2).produce("FUEL", 1), 165);
    });

    test("Test 03", () {
      expect(Nanofactory(t3).produce("FUEL", 1), 13312);
    });

    test("Test 04", () {
      expect(Nanofactory(t4).produce("FUEL", 1), 180697);
    });

    test("Test 05", () {
      expect(Nanofactory(t5).produce("FUEL", 1), 2210736);
    });

    test("Solution test", () {
      final day = Day14("lib/day14/input.txt");
      expect(day.solvePart01(), 399063);
    });
  });

  group("Part 02", () {
    test("Test 01", () {
      expect(Nanofactory(t3).fuelProducedFromOre(trillion), 82892753);
    });

    test("Test 02", () {
      expect(Nanofactory(t4).fuelProducedFromOre(trillion), 5586022);
    });

    test("Test 03", () {
      expect(Nanofactory(t5).fuelProducedFromOre(trillion), 460664);
    });

    test("Solution test", () {
      final day = Day14("lib/day14/input.txt");
      expect(day.solvePart02(), 4215654);
    });
  });
}
