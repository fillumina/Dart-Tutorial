void main(List<String> args) {
  var set = {1, 2, 3};
  assertEqualSets(set, {1, 2, 3});
  set.add(2);
  assertEqualSets(set, {1, 2, 3});

  // spread operator
  var other = {1, ...set, 4};
  assertEqualSets(other, {1, 2, 3, 4});
}

/// utility method to compare 2 sets
/// the default Object.operator==() is true only if the two sets are the same
/// object, not if they have the same content (semantic equality)
void assertEqualSets<T>(final Set<T> a, final Set<T> b) {
  if (a.length != b.length) {
    throw AssertionError('different sizes');
  }
  if (!(a.containsAll(b) && b.containsAll(a))) {
    throw AssertionError("the sets are not equal");
  }
}
