void main(List<String> args) {
  const map = <int, String>{0: 'zero', 1: 'one', 2: 'two'};
  assert(map[0] == 'zero');
  assert(map[1] == 'one');
  assert(map[2] == 'two');

  // generator from iterable
  // ignore: prefer_for_elements_to_map_fromiterable
  final m = Map<int, String>.fromIterable([0, 2, 4],
      key: (e) => e, value: (e) => '$e');
  assertEqualMaps(m, {0: '0', 2: '2', 4: '4'});

  // generator from iterables
  var keys = ['a', 'b', 'c'];
  var values = [0, 1, 2];
  final m2 = Map<String, int>.fromIterables(keys, values);
  assertEqualMaps(m2, {'a': 0, 'b': 1, 'c': 2});

  // inline generator
  final m3 = {
    for (var e in [0, 2, 4]) e: '$e'
  };
  assertEqualMaps(m3, {0: '0', 2: '2', 4: '4'});
}

void assertEqualMaps<K, V>(final Map<K, V> a, final Map<K, V> b) {
  if (a.length != b.length) {
    throw AssertionError('different sizes');
  }
  for (MapEntry<K, V> e in a.entries) {
    if (b[e.key] != e.value) {
      throw AssertionError("b[${e.key}] = ${b[e.key]} instead of ${e.value}");
    }
  }
}
