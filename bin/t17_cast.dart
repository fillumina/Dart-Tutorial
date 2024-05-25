void main(List<String> args) {
  // using var would have made radius int because of type inference
  Object radius = 10;

  // cast tells the compiler the actual type, it cannot force conversions:
  // using the wrong type would fail at runtime!
  var circumference = (radius as int) * 3.1415;
  // double binary divisions are always approximated so we round to 3 decimals
  assert((circumference * 1000).toInt() / 1000 == 31.415);

  dynamic side = 10.1;
  // check the type of the variable at runtime
  if (side is double) {
    // here side is defined as 'double side'
    assert(side * 4 == 40.4);
  } else {
    // fail with message
    assert(false, 'cannot recognize as double');
  }
}
