// generates a _synchronous_ stream
// items generation happens on request instead than ahead.
// synchronously means as with normal code (non async).
// note that the method is 'sync*' and not 'async*'
Iterable<int> synchronousStreamNumberGenerator() sync* {
  for (int i = 0; i < 5; i++) {
    yield i;
  }
}

void main() {
  for (int i in synchronousStreamNumberGenerator()) {
    print('generated synchronously: $i');
  }
}
