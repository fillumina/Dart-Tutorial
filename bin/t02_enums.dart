enum Fruit { apple, lemon, melon }

// define an enum with constructor and methods
enum Poligon {
  triangle(3),
  square(4),
  pentagon(5),
  hexagon(6);

  final int sides;
  const Poligon(this.sides);

  double perimeter(double sizeLength) {
    return sizeLength * sides;
  }
}

void main() {
  const fruit = Fruit.apple;
  var fruitByIndex = Fruit.values[
      Fruit.apple.index]; // cannot be const because values[] is not constant

  // enum methods
  assert(fruit == fruitByIndex);
  assert(fruit.name == 'apple');
  assert(Fruit.values.length == 3);

  var fruitByName = Fruit.values.byName('apple');
  assert(fruitByName == fruit);

  assert(Poligon.triangle.perimeter(2.5) == 7.5);

  // how to use switch() with enums
  for (var p in Poligon.values) {
    switch (p) {
      case Poligon.triangle:
        break; // is optional unless there is no expression
      case Poligon.square:
        print('$p => square'); // break is omitted
      case Poligon.pentagon:
      // without a break or an expression the hexagon case is executed as well
      case Poligon.hexagon:
        print('$p => hexagon or pentagon');
      default:
        throw Exception('unexpected value $p');
    }
  }
}
