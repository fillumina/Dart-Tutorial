import 'dart:async';

/// Future is a way to defer code execution to a later time.

// define a method create() that returns a Future that give back a string 'Dart'
Future<String> create() => Future(() => 'Dart');

// define a method delayed() that returns a Future that will give back the
// string 'Result' 1 second after it's invoked (delay)
Future<String> delayed() {
  // uses a Future factory
  return Future<String>.delayed(
      const Duration(seconds: 1), // delay
      () => 'Result');
}

// define a method error() that should give back an int but instead give
// back an error with a message.
Future<int> error() {
  return Future<int>.error('this is an error message');
}

// define a method that accepts both a Future thet gives back an int or an int.
Type acceptFutureOrValue(FutureOr<int> value) => value.runtimeType;

// the function is marked 'async' because we use the keyword 'await' inside
// see the next tutorial 't29_async_await.dart'
void main(List<String> args) async {
  // call a method that returns a Future and after it completes manage the
  // result with an executor
  delayed().then((r) {
    assert(r == 'Result');
  });

  create().then((value) {
    assert(value == 'Dart');
  });

  // in case of error the then() clause is not executed, then() must specify
  // the expected return type otherwise it gets lost on catchError()
  error().then<int>((r) => throw AssertionError()).catchError((m) {
    assert(m == 'this is an error message');
    return -1;
  });

  // returns a future in a completed state
  var future = Future<int>.value(10);

  assert(acceptFutureOrValue(10) == int);
  var type = acceptFutureOrValue(future);
  // for some strange reason type != Future<int> even if it is
  assert(type.toString() == (Future<int>).toString());

  // Future chaining
  Future<String> one() => Future.value('1');
  Future<String> two() => Future.value('2');
  Future<String> three() => Future.value('3');

  var result = [];
  one().then((v) {
    result.add(v);
    return two();
  }).then((v) {
    result.add(v);
    return three();
  }).then((v) {
    result.add(v);
    print(result);
    assertEqualLists(result, ['1', '2', '3']);
  }).catchError((v) {
    // catch errors from all Futures in the chain
    print('error');
  }).whenComplete(() {
    // sort of try..finally for chains of Futures
    print('finally');
  });
  assertEqualLists(result, ['1', '2', '3']);

  // the same chain could have been written using the wait() Future factory
  var resultList = await Future.wait<String>([one(), two(), three()]);
  assertEqualLists(resultList, ['1', '2', '3']);
}

// helper function to compare lists by content
void assertEqualLists<T>(final List<T> a, final List<T> b) {
  if (a.length != b.length) {
    throw AssertionError('different sizes');
  }
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) {
      throw AssertionError(
          'different at index $i, a[$i] == ${a[i]} while b[$i] == ${b[i]}');
    }
  }
}
