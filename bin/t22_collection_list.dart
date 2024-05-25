import "dart:collection";

void main(List<String> args) {
  var growableList = [1, 2];
  growableList.add(3);
  assertEqualLists(growableList, [1, 2, 3]);

  var constantList = const [5, 7, 6];
  try {
    constantList.add(9);
  } on UnsupportedError {
    // Expected runtime exception: can't modify a constant list
  }

  // using a generator
  final intList = List<int>.filled(3, 0);
  assertEqualLists(intList, [0, 0, 0]);

  // creates a new unmodifiable list from a given one (the 2 are different)
  var list = [1, 2, 3];
  var unmodifiable = List<int>.unmodifiable(list);
  list.add(4);
  assertEqualLists(list, [1, 2, 3, 4]);
  assertEqualLists(unmodifiable, [1, 2, 3]);

  // this is just a wrapper to the given list (the created one is a view)
  list = [1, 2, 3];
  var unmodifiableView = UnmodifiableListView(list);
  list.add(4);
  assertEqualLists(list, [1, 2, 3, 4]);
  assertEqualLists(unmodifiableView, [1, 2, 3, 4]);

  // collection statements (conditional items)
  var hasCoffee = false;
  var jobs = [
    'welder',
    'journalist',
    // ignore: dead_code
    if (hasCoffee) 'Developer' else 'Zombie'
  ];
  assertEqualLists(jobs, ['welder', 'journalist', 'Zombie']);

  // collection for (generator)
  var values = [0, 1, for (var i = 0; i < 5; i += 2) i, 6, 7];
  assertEqualLists(values, [0, 1, 0, 2, 4, 6, 7]);

  // spread operator: used to copy a list into another (l1 is copied into l2)
  var l1 = [0, 1, 2];
  var l2 = [-1, ...l1, -1];
  assertEqualLists(l2, [-1, 0, 1, 2, -1]);

  // spread operator might contain a ? if it might be null
  List<int>? l3;
  var l4 = [-1, ...?l3, -1];
  assertEqualLists(l4, [-1, -1]);
}

/// utility method to compare 2 lists
/// the default Object.operator==() is true only if the two lists are the same
/// object, not if they have the same content (semantic equality)
void assertEqualLists<T>(final List<T> a, final List<T> b) {
  if (a.length != b.length) {
    throw AssertionError('different sizes');
  }
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      throw AssertionError(
          'different at index $i, a[$i] == ${a[i]} while b[$i] == ${b[i]}');
    }
  }
}
