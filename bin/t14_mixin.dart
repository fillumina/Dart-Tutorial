// mixin are utility classes without a constructor that can be added to other
// classes: a class can be extended with one o more mixins using the
// keyword 'with' instead of 'extends'

mixin Caps {
  // mixin fields must be initialized
  String message = '';

  String allCaps() => message.toUpperCase();
}

mixin Sum {
  int b = 12;

  int sum(int a) => a + b;
}

class Person with Caps, Sum {}

void main() {
  var p = Person();

  p.b = 3;
  assert(p.sum(2) == 5);

  p.message = 'hello';
  assert(p.allCaps() == 'HELLO');
}
