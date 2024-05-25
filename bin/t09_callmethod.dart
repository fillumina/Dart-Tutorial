class Price {
  final double tax;

  const Price(this.tax);

  // implementing call() makes this class callable as it was a function
  double call(double price) => price * tax;
}

void main(List<String> args) {
  var vat = Price(1.2);

  // calling the class as a function
  assert(vat(10) == 12.0);
}
