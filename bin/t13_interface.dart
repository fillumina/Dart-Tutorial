// Dart doesn't have interfaces: every class can be used as an interface
// - implementing another class means to implement every methods of that class and
// - multiple interface implementation is allowed
// - it's advisable to use abstract classes as interfaces

abstract class Person {
  String name;
  final int _age;
  double height;

  Person(this.name, int age, this.height) : _age = age;

  // private method
  void _privateMethod() {}

  // public method
  void publicMethod() {
    _privateMethod(); // to shut up a warning...
  }

  @override
  String toString() => "$name, $_age";
}

class Greeter {
  void sayHello() {
    print("hi!");
  }
}

// an implementing class must implement every methods both private and public
// and also the getters and setters of the fields according the their
// accessibility
class Alumn implements Person, Greeter {
  // height implements the contract of the Person.height field
  @override
  double height;

  Alumn(this.height);

  // the contract with Person.name can also be complied using only a
  // getter and a setter without having to define a field named name
  // (whith the same effect).
  @override
  String get name => throw UnimplementedError();

  @override
  set name(String n) {}

  // _age is only readable (it's final in Person._age and cannot be modified)
  // so it needs only a getter
  @override
  int get _age => throw UnimplementedError();

  @override
  void _privateMethod() {}

  @override
  void publicMethod() {}

  @override
  void sayHello() {}
}
