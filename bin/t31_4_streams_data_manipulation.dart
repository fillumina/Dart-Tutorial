import 'dart:async';

void main() {
  // use streams to manipulate data in a flow
  // this is similar to the java implementation
  Stream<int>.fromIterable([for (int i = 0; i < 10; i++) i])
      .where((event) => event.isEven)
      .map((event) => "mapped: ${event * 2}")
      .forEach(print);
}
