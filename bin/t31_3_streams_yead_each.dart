import 'dart:async';

Stream<int> generateFirst() async* {
  yield 1;
  yield 2;
}

Stream<int> generateSequence() async* {
  // 'yield*' concatenate another generator
  yield* generateFirst();
  yield 3;
  yield 4;
}

void main() async {
  await for (final event in generateSequence()) {
    print('yield each event: $event');
  }
}
