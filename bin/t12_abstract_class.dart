// abstract classes cannot be instantiated
abstract class A {
  // example of variable
  final int variable;

  const A(this.variable);

  // abstract method
  void mustBeOverridden();

  // implemented method
  String sayHello() {
    return 'hello $variable';
  }

  // static method
  static log(String msg) {
    print('A: $msg');
  }
}

// but only extended
class B extends A {
  B(super.variable);

  @override
  void mustBeOverridden() {}
}

void main(List<String> args) {
  var b = B(10);
  assert(b.sayHello() == 'hello 10');
}
