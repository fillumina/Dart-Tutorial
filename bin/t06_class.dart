/// This is a doc comment which will be returned by IDEs for documentation.
/// Doc comments use the _markdown_ syntax.
///
/// there are not accessors but if the class name is prefixed with an undescore
/// it means it's private to the file (library in dart) and cannot be accessed
/// from outside. This is true for all the names.
class Person {
  final String name;
  final int age;

  // static immutable instance
  static const Person unbornPerson = Person('', -1);

  // default generative constructor (generates a new instance at each call)
  // the parameters are automatically setting the fields with the same name.
  // because the fields are final the constructor (and so the generated
  // object) can be constant and the object will be immutable.
  //
  // dart doesn't support method overriding (same method name with different
  // parameters) so there could always be only one
  // method with the same name and only one constructor.
  const Person(this.name, this.age);

  // named constructor
  const Person.adult(this.name) : age = 18;

  // redirecting constructor
  const Person.unborn() : this('', -1);

  // a factory can have a body and might not return a new object
  factory Person.create(String name, int age) {
    if (name == '' && age == -1) {
      return unbornPerson;
    }
    return Person(name, age);
  }

  bool isUnborn() => age < 0;

  @override // this is an annotation
  String toString() => '$name, $age';
}

/// extending a parent class means to inherit all methods and fields
/// it is only possible to extend one class
class Alumn extends Person {
  // the _ means that this field is private to the file (also called library)
  // note that _course is not final so the class cannot be const
  String _course;

  // we use course in the signature to avoid using the _ which is not nice to see
  // (but still legit)
  // note that the class cannot be const because _course is not final
  Alumn(super.name, super.age, String course) : _course = course;

  @override // this is an annotation that means we are rewriting a parent method
  String toString() => '$_course: $name, $age';
}

// this is a singleton (a class with only one instance allowed)
class God extends Person {
  // a private static const variable containing the one and only instance
  static const _instance = God._();

  // defines a private constructor that can't be called outside the library
  const God._() : super('God', 10000);

  // a factory constructor that always returns the same immutable instance
  factory God() => _instance;
}

class Employee extends Person {
  // 'late' defines a variable that is initialized in the constructor
  late final double _salary;

  // a constructory with a body cannot be const
  Employee(super.name, super.age, double salary) {
    _salary = salary > 0 ? salary : 0;
  }

  bool isGoodSalary() => _salary > 12000;
}

void main() {
  // note the const before the constructor Person(), it creates the same
  // instance for a call with same parameters so a and b are the same object.
  final personA = const Person('Alberto', 12);
  final personB = const Person('Alberto', 12);

  // this is true because const classes are immutable and dart reuses
  // declared const instances to save memory
  // the equal sign is a semantical equality and can be customized, by default
  // it means that two objects are the same (like identical())
  assert(personA == personB);

  // identical means they are they are the same object
  assert(identical(personA, personB));

  // use the overwritten method toString()
  assert(personA.toString() == 'Alberto, 12');

  assert(personA.age == 12);
  assert(personB.name == 'Alberto');

  // without the const dart creates an new object
  final personC = Person('Alberto', 12);
  assert(personA != personC);

  // because Alumn is not const cannot be assigned to a const variable
  var alumnA = Alumn('Alberto', 12, '1A');
  assert(alumnA != personA);
  assert(alumnA.toString() == '1A: Alberto, 12');

  var alumnB = Alumn('Alberto', 12, '1A');
  // Alumn is not const and the two instances are different in memory
  assert(alumnB != alumnA);

  // not being final course can be reassigned (but only in this same
  // file (or library) because it's still private (the prefixed underscore _)
  alumnB._course = '1B';

  const unborn = Person.unbornPerson;
  assert(unborn.isUnborn());

  const anotherUnborn = Person.unborn();
  assert(anotherUnborn.isUnborn());

  const adult = Person.adult('John');
  assert(adult.age == 18);

  var zeus = God();
  var jupiter = God();
  // God() always returns the same God
  assert(zeus == jupiter);
  identical(zeus, jupiter);

  var sara = Employee('Sara', 23, 12000);
  assert(!sara.isGoodSalary());

  // using a factory
  var f = Person.create('Salvo', 56);
  assert(f.name == 'Salvo');

  // note that a const variable can be created only if all parameters of the
  // const constructor are constants too.
  // Here we cannot instantiate a constant variable
  // because the method returns a non constant Person.
  final soldier = createSoldierWithSeniority('Charilie', 2);
  assert(soldier.age == 20);
}

// the Person returned is not constant because the parameters name and
// seniority are not constant
Person createSoldierWithSeniority(String name, int seniority) {
  return Person(name, 18 + seniority);
}
