import 'dart:async';

// a stream is a flux of events that might happen synchronously or asyncrhonously
// there is a producer that generates the events and a consumer that
// listen for them.

// This is the best way to create a stream as a function
// 'async*' marks a function returning a stream asynchronously
Stream<int> createNumberStreamUsingYield() async* {
  for (int value = 0; value < 3; value++) {
    // just sleep for some time (we don't use this Future)
    await Future<void>.delayed(const Duration(seconds: 1));
    // return the next value of the stream
    yield value;
  }
}

void main() async {
  // the stream is created but not started
  final firstStream = createNumberStreamUsingYield();

  // starts the stream by listening to its values
  // a stream can be listened only by one listener
  // at a time (single listener mode)
  firstStream.listen((event) {
    print('got event: $event');
  });

  // let's create another stream
  final secondStream = createNumberStreamUsingYield();

  // we use another simpler notation here
  // NOTE: the code execution doesn't stop at await
  await for (final event in secondStream) {
    print('iterate to next value: $event');
  }

  print('readNumberStream() end');
}
