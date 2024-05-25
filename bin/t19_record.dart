// Records are immutable mixed type tuple
// often used to return multiple values from a function

(double, {bool negative}) sign(double value) {
  if (value < 0) {
    return (-value, negative: true);
  }
  return (value, negative: false);
}

void main(List<String> args) {
  // the last item is a named argument. named items can only be at the end.
  // named items are just easier to retrieve
  const record = ('Dart', 12, true, isOpenSource: true);

  // that's the type of the record
  (String, int, bool, {bool isOpenSource}) r = record;

  // items in a record can be indexed via $1, $2 ... (starting with $1 not $0)
  assert(r.$1 == 'Dart');

  // using positional index
  assert(record.$1 == 'Dart');
  assert(record.$2 == 12);
  assert(record.$3 == true);
  // using named index
  assert(record.isOpenSource == true);

  // record extends Object as well so they implements toString()
  print(record);

  // we can parse the result as a record
  var result = sign(100);
  assert(result.$1 == 100);
  assert(result.negative == false);

  // or we can define 2 variables to get the results of the record from sign()
  var (double a, negative: b) = sign(-12.3);
  assert(a == 12.3);
  assert(b == true);
}
