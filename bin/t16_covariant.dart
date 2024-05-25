// the covariant keyword restrict the inheriting methods to use subclasses

abstract class Animal {
  const Animal();
  void eats(Animal animal);
}

class Rabbit extends Animal {
  const Rabbit();

  @override
  void eats(Animal animal) {}
}

class Wolf extends Animal {
  const Wolf();

  // here covariant allows to restrict the required type to a subtype of it
  @override
  void eats(covariant Rabbit animal) {}
}

void main() {
  var rabbit = Rabbit();
  var wolf = Wolf();

  wolf.eats(rabbit);
}
