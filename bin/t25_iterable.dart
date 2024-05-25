/// implements an Iterator over int
class SquareIterator implements Iterator<int> {
  int _current = 0;

  // the value returned at each iterations
  @override
  int get current => _current * _current;

  // the action that move to the next element or terminate iterating
  // returning false
  @override
  bool moveNext() {
    _current++;
    return _current < 5;
  }
}

class SquareIterable extends Iterable<int> {
  @override
  Iterator<int> get iterator => SquareIterator();
}

void main(List<String> args) {
  var list = [for (var i in SquareIterable()) i];
  assert(list[0] == 1);
  assert(list[1] == 4);
  assert(list[2] == 9);
  assert(list[3] == 16);
}
