// generics are a way to use the same template class for different types
// this class can be instantiated to hold a specific type and the compiler
// will make sure the contract will not be broken.

// a class with generics
class Holder<T> {
  T value;

  Holder(this.value);
}

abstract class Animal {
  final String name;

  const Animal(this.name);
}

class Dog extends Animal {
  Dog(super.name);
}

class Feline extends Animal {
  Feline(super.name);
}

class Cat extends Feline {
  Cat(super.name);
}

class Tiger extends Feline {
  Tiger(super.name);
}

// Accepts only feline and its subclasses
class FelineHolder<T extends Feline> extends Holder<T> {
  FelineHolder(super.value);
}

// using generics on a method
T last<T extends Animal>(List<T> list) {
  return list.last;
}

void main() {
  Holder<int> intHolder = Holder(12);
  assert(intHolder.value == 12);

  // doesn't compile:
  //intHolder.value = 'hello';

  Holder<String> stringHolder = Holder('Hello');
  assert(stringHolder.value == 'Hello');

  // implicit generics
  // differently from java the generics type is inferred not omitted
  var listHolder = Holder([0, 3, 11]);
  assert(listHolder.value.runtimeType == List<int>);

  // doesn't compile either
  //listHolder.value = 'hello';

  var felineHolder = FelineHolder(Cat('Felix'));
  assert(felineHolder.value.name == 'Felix');

  // this would not be compiled:
  //var dogFilineHolder = FelineHolder(Dog('Toby'));

  List<Animal> mixedAnimalList = [Dog('Rex'), Feline('Roby'), Cat('Smelly')];
  assert(mixedAnimalList.isNotEmpty);

  List<Feline> felineList = [Cat('Max'), Tiger('Maximus')];
  assert(felineList.isNotEmpty);

  List<Dog> dogList = [Dog('Rex'), Dog('Maya')];
  assert(dogList.isNotEmpty);

  assert('Lion' == last([Dog('max'), Feline('Lion')]).name);
}
