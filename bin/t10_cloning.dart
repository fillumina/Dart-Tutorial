class Name {
  final String first;
  final String second;

  const Name(this.first, this.second);
}

class Person {
  final Name name;
  final int age;

  const Person(this.name, this.age);

  factory Person.create(String first, String second, int age) {
    return Person(Name(first, second), age);
  }

  // by convention constant dart classes implements copyWith() to allow cloning
  Person copyWith({Name? name, int? age}) {
    // cannot return a constant Person because parameters are not constant
    return Person(
        // ?? means to use the second parameter only if the first is null
        name ?? this.name,
        age ?? this.age);
  }
}

void main() {
  const p = Person(Name('John', 'Doe'), 24);
  final c = p.copyWith(name: Name('Bob', 'Noob'));
  assert(c.name.first == 'Bob');
  assert(c.age == 24);
}
