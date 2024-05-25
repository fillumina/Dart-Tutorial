class Fraction {
  final int num;
  final int den;

  // private constructor use of(): const constructors cannot have body
  const Fraction._(this.num, this.den);

  // factory with simplification code
  factory Fraction.of(int n, int d) {
    bool flag;
    do {
      flag = false;
      for (int p in [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]) {
        if (n ~/ p == (n / p) && d ~/ p == (d / p)) {
          n = n ~/ p;
          d = d ~/ p;
          flag = true;
        }
      }
    } while (flag);
    return Fraction._(n, d);
  }

  @override
  String toString() => '$num/$den';

  /// defines + operator between two Fractions
  Fraction operator +(Fraction other) {
    return Fraction.of(num * other.den + other.num * den, den * other.den);
  }

  /// defines - operator between two Fractions
  Fraction operator -(Fraction other) {
    return Fraction.of(num * other.den - other.num * den, den * other.den);
  }

  // defines - unary operator that return a new fraction with opposed sign
  Fraction operator -() {
    return Fraction.of(-num, den);
  }

  /// helper method
  bool equals(int n, int d) => n == num && d == den;

  // use the == operator to manage equality (override Object method)
  @override
  bool operator ==(covariant Fraction other) =>
      num == other.num && den == other.den;

  // hashCode is useful to manage Fraction in maps and sets
  @override
  int get hashCode => Object.hash(num, den);
}

void main(List<String> args) {
  final sum = Fraction.of(1, 2) + Fraction.of(2, 3);
  assert(sum.equals(7, 6));

  final sub = Fraction.of(1, 2) - Fraction.of(2, 3);
  assert(sub.equals(-1, 6));

  final inverted = -Fraction.of(1, 2);
  assert(inverted.equals(-1, 2));

  final simplified = Fraction.of(20, 15);
  assert(simplified.num == 4 && simplified.den == 3);

  assert(Fraction.of(2, 3) == Fraction.of(4, 6));
}
