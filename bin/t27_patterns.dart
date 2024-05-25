// several peculiar ways to match an expression and set variables directly from
// structured objects

void main(List<String> args) {
  // record destructuring
  final (a, b, c) = (1, 'one', true);
  assert(a == 1);
  assert(b == 'one');
  assert(c == true);

  // list destructuring
  final [x, y] = [4, 'nano'];
  assert(x == 4);
  assert(y == 'nano');

  // map destructuring
  final {'one': one, 'two': two} = {'one': 1, 'two': 2};
  assert(one == 1);
  assert(two == 2);

  const record = (1, 2);
  switch (record) {
    // destructure record in a switch case
    case (1, 2):
      print('match');
    default:
      assert(false);
  }

  // using record conditionals in switch to match types
  switch ((1, 2)) {
    // ignore: pattern_never_matches_value_type, unused_local_variable
    case (String a, String b):
      throw AssertionError();
    // ignore: unused_local_variable
    case (double a, double b):
      throw AssertionError();
    case (int a, int b) when a > b:
      throw AssertionError();
    case (num a, num b) when a < b:
      // ok
      break;
    default:
      throw AssertionError();
  }

  // getting a result out of switch
  var val = 2 * 2;
  var result = switch (val) {
    1 => 'one',
    // logical expression
    2 || 3 => 'two',
    _ when val > 3 && val < 6 => 'correct',
    _ => 'wrong'
  };
  assert(result == 'correct');

  // using placeholders
  final list = [1, 2];
  switch (list) {
    case [_]:
      throw AssertionError('not match');
    case [1, 4 || 5]:
      throw AssertionError('not match');
    case [_, _]:
      // ok
      break;
    default:
      throw AssertionError('not match');
  }

  // using implicit
  final number = 5 * 5;
  var res = switch (number) {
    == 0 => 'zero',
    > 0 && < 10 => 'low',
    > 20 => 'correct',
    _ => 'other'
  };
  assert(res == 'correct');

  // map pattern
  const map = {'a': 1, 'b': 2};
  var resultMap = switch (map) {
    {'a': 666} => 'wrong',
    {'a': int a, 'b': int b} when map.length == 2 => 'ok $a $b',
    _ => 'wrong'
  };
  assert(resultMap == 'ok 1 2');

  // destructuring using patterns on record
  // assings the value of the parameter named someValue to a variable with the
  // same name
  final (:someName, someValue) = (someName: 1, 'value');
  assert(someName == 1 && someValue == 'value');

  // this is the same destructuring assignment without the variable shortcut
  final (someName: int sn, sv) = (someName: 1, 'value');
  assert(sn == 1 && sv == 'value');

  // object matching, use pattern to match objects by their constructor
  var point = Point(1, 2);
  switch (point) {
    case Point(x: 0, y: 0): // note the use of named parameters
      throw AssertionError('origin');
    case Point(x: final x, y: final y) when x == y:
      throw AssertionError('diagonal');
    case Point(x: final x, y: final y) when x == 1 && y == 2:
      break; // ok
    default:
      throw AssertionError('wrong');
  }

  // if case
  final json = {
    'skills': ['Dart', 'Flutter']
  };
  if (json case {'skills': [String first, String second]}) {
    assert(first == 'Dart' && second == 'Flutter');
  } else {
    throw AssertionError('should have matched!');
  }
  // ignore: unused_local_variable
  if (json case {'skills': [String firstOnly]}) {
    throw AssertionError('should not match!');
  }
}

class Point {
  final int x;
  final int y;
  Point(this.x, this.y);
}
