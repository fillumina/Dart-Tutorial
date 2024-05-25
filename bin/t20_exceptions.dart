// exceptions can only be implemented.
// Any class can be thrown as an exception (even String or int) but if you
// need to catch an exception with all its subclasses then it's useful to
// sublcass Exception or some other known exception.
class FractionException /*implements Exception*/ {
  final String message;

  const FractionException(this.message);

  @override
  String toString() => 'FractionException: $message';
}

class Fraction {
  final int numerator;
  final int denominator;

  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      throw FractionException("denominator cannot be 0");
    }
  }
}

void main(List<String> args) {
  // Exception can be instantiated but not extended
  try {
    throw Exception('test');
  } on Exception catch (ex) {
    assert(ex.toString().contains('test'));
  }

  try {
    Fraction(1, 0);
  } on FractionException catch (ex) {
    print(ex);
    // don't lose stacktrace as it would be if using 'throw ex'
    rethrow;
  } finally {
    // executed anyway
    print("executed in all cases");
  }
}
