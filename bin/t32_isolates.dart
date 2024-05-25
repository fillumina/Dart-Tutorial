import 'dart:isolate';

Future<void> asynchronousCounting() async {
  Stream<int>.periodic(Duration(seconds: 1), (computationCount) {
    return computationCount;
  }).take(5).forEach((element) {
    // this code is executed asychronously when a new event fires
    print('counter: $element');
  });
}

Future<int> veryLongOperation() async {
  // 3 seconds delay
  await Future.delayed(Duration(seconds: 3), () {});
  // the status is not synced with the main isolation
  print('status: $status');
  return 42;
}

String status = 'start';

Future<void> runIsolate() async {
  // the program wait for the Isolate to terminate.
  // veryLongOpereation() does not consume microtasks on the local isolate.
  int result = await Isolate.run<int>(
      // in the isolate the status is in its definition state
      () => veryLongOperation());
  assert(result == 42);
  print('the isolate has completed with result: $result');
}

Future<void> main(List<String> args) async {
  // do some asynchronous counting
  asynchronousCounting();

  // the program doen't wait for the Isolate to terminate
  printStatus('before first runIsolate()');
  runIsolate();
  printStatus('after the first and before second runIsolate()');

  // unlesss we use 'await' keyword
  await runIsolate();
  printStatus('after the second runIsolate()');

  printStatus('end main()');
}

void printStatus(String s) {
  status = s;
  print('change status to: $status');
}
