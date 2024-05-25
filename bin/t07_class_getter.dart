// a mutable class
class Counter {
  // this field is private
  int _index = 0;

  // this field is also private
  String _message = '';

  // index getter
  int get index => _index;

  // message setter
  set message(String msg) => _message = msg;

  // constructor with optional values, note that it cannot be constant
  // because fields are not final.
  Counter({index = 0, message = 'counter: '})
      : _index = index,
        _message = message;

  // method to increment the counter
  void increment() => _index++;

  @override
  String toString() => '$_message: $_index';
}

void main() {
  var counter = Counter(index: -10, message: 'missing steps');

  // use the getter
  assert(counter.index == -10);

  // use the overwritten method toString()
  assert(counter.toString() == 'missing steps: -10');

  // use the method increment() that modifies the class internal state
  counter.increment();
  assert(counter.toString() == 'missing steps: -9');

  // use the setter
  counter.message = 'almost there';
  assert(counter.toString() == 'almost there: -9');
}
