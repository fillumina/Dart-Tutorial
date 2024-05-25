// async await keywords help manage future code in a more natural way

// a method the returns a Future that will give back a string after a delay
Future<String> producer() {
  return Future<String>.delayed(Duration(seconds: 1), () => 'Dart');
}

// a method that execute a future by using 'await' must be marked with 'async'
void consumerWithAwait() async {
  // 'await' allows to avoid the .then() construct and continue the execution
  // directly with the returned value after the Future is resolved.
  final value = await producer();
  assert(value == 'Dart');
}

// example of the previous method() without using 'asinc' 'await'
// the two methods are functionally equal
void consumerWithoutAwait() {
  producer().then((value) {
    assert(value == 'Dart');
  });
}

// a method that returns a Future that will resolve in an error with message
Future<String> producerWithException() {
  return Future<String>.error('my error message');
}

// manage errors with 'await'
void consumerExceptionWithAwait() async {
  // using 'await' the error is managed with the usual try catch
  try {
    final value = await producerWithException();
    assert(value == 'not used because of the exception');
  } on String catch (ex) {
    // Dart can throw (and catch) any class, String included
    assert(ex == 'my error message');
    print('error cathed by await consumer');
  } finally {
    print('finally by await consumer');
  }
}

// this is the same method as before but using the then() construct
void consumerExceptionWithoutAwait() {
  producerWithException().then((value) => null).catchError((error) {
    assert(error == 'my error message');
    print('error catched by non await consumer');
  }).whenComplete(() => print('finally by non await consumer'));
}

void main(List<String> args) async {
  consumerWithAwait();
  consumerWithoutAwait();

  consumerExceptionWithAwait();
  consumerExceptionWithoutAwait();
}
