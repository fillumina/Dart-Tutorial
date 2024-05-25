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
  return 42;
}

Future<void> runIsolate() async {
  // the program wait for the Isolate to terminate.
  // veryLongOpereation() does not consume microtasks on the local isolate.
  int result = await Isolate.run<int>(() => veryLongOperation());
  assert(result == 42);
  print('the isolate has completed with result: $result');
}

Future<void> main(List<String> args) async {
  // do some asynchronous counting
  asynchronousCounting();

  // the program doen't wait for the Isolate to terminate
  runIsolate();
  print('after the first runIsolate()');

  // unlesss we use 'await' keyword
  await runIsolate();
  print('after the second runIsolate()');

  print('end main()');
}
