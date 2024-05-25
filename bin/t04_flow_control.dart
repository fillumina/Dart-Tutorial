// DART uses the usual C like flow controls
// only switch is slightly modified by making break optional (see t02_enums.dart).

void main() {
  // the usual C like way
  for (int i = 0; i < 10; i++) {
    if (i.isOdd) {
      print('$i is odd');
    } else if (i == 0) {
      print('zero');
    } else {
      print('$i is even');
    }
  }

  // cycles into iterables (i.e. a list)
  for (var s in ['one', 'two', 'three']) {
    print(s);
  }

  var c = -1;
  while (c < 5) {
    print('while: ${c++}');
  }

  // useful when there is an initial state not satisfying the condition
  var d = -1;
  do {
    print('do-while: ${d++}');
  } while (d >= 0 && d < 5);
}
