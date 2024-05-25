class Director {
  String name;
  int age;

  Director(this.name, this.age);

  // equality in const object is ensured by the fact that
  // equal objects share the same instance if they are created as const
  // so there is no need to override == operator: the default implementation
  // is ok.
  @override
  bool operator ==(covariant Director other) {
    return name == other.name && age == other.age;
  }

  @override
  int get hashCode => Object.hash(name, age);
}

void main(List<String> args) {
  var a = Director('Sally', 35);
  var b = Director('Sally', 35);
  assert(a == b);

  a.name = 'Herbert';
  a.age = 30;
  assert(a != b);
}
