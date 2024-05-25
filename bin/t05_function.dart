// this is a function returning an int
int sum(int x, int y) {
  return x + y;
}

// we can assing sum to another typed variable
// ------------------| this is the type
int Function(int, int) addition = sum;

// or an untyped one
var summation = sum;

void main() {
  // Functions are objects in Dart
  Object func = sum;
  assert(func.runtimeType.toString() == '(int, int) => int');

  assert(addition(2, 3) == 5);
  assert(summation(2, 3) == 5);

  // this is a shortcut to declare a funcion with only one expression
  int subtract(int x, int y) => x - y;
  assert(subtract(5, 2) == 3);

  // a function can be anonymous
  // ignore: prefer_function_declarations_over_variables
  var add = (int x, int y) => x + y;
  // ignore: prefer_function_declarations_over_variables
  var sub = (int x, int y) => x - y;

  // and can be passed as parameter
  int result(int Function(int x, int y) op, int x, int y) {
    // all Function objects inherit the method call()
    // with the needed parameters and return type
    return op.call(x, y);
  }

  // passing a function like this is called 'tear off'
  assert(result(add, 3, 2) == 5);
  assert(result(sub, 5, 3) == 2);

  // optional named parameters following a normal one
  double price(bool served, {int caffe = 1, int pastry = 0, int water = 0}) {
    return (caffe * 1.8 + pastry * 2.0 + water * 2.0) * (served ? 1.2 : 1);
  }

  // named optional parameters can be passed using the name:value notation
  assert(price(true, caffe: 2) == 3.6 * 1.2);
  assert(price(false, pastry: 1, water: 1) == 5.8);

  // required and optional named parameters
  String hello(
      {required String firstName,
      String? middleName,
      required String lastName}) {
    return 'Hello $firstName ${middleName ?? ''} $lastName';
  }

  assert(hello(firstName: 'Martin', middleName: 'Luther', lastName: 'King') ==
      'Hello Martin Luther King');
  assert(hello(firstName: 'Francesco', lastName: 'Illuminati') ==
      'Hello Francesco  Illuminati'); // double space here

  // optional sequential parameters (telescopic parameters)
  int accumulate([int? a, int? b = 0, int? c]) {
    // the ?? operator returns the second parameter if the first is null
    return (a ?? 0) + (b ?? 0) + (c ?? 0);
  }

  assert(accumulate() == 0);
  assert(accumulate(1) == 1);
  assert(accumulate(1, 2) == 3);
  assert(accumulate(1, 3, 5) == 9);

  String say(String message) {
    // methods can be nested. this method is not visible outside say()
    String surprise(var text) {
      return "$text!";
    }

    return surprise(message);
  }

  assert(say('Hello') == 'Hello!');
}
