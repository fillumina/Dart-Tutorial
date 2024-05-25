import 'dart:async';
import 'dart:math';

Future<int> computeValue() {
  final completer = Completer<int>();

  Future<void>.delayed(Duration(seconds: 2), () {
    print('executing computation...');
    // using completer make it simple to convert normal code that throws
    // exceptions to Future that incapsulates them into an error clause
    try {
      completer.complete(doComputation());
    } on String catch (error) {
      completer.completeError(error);
    }
  });

  print('return from computeVaue()');

  // return the future that will be resolved when the completer.complete()
  // or completer.completeError() will be called
  return completer.future;
}

int doComputation() {
  int rnd = Random().nextInt(10);
  if (rnd.isEven) {
    return rnd;
  } else {
    throw 'error';
  }
}

void main(List<String> args) async {
  try {
    final computedValue = await computeValue();
    print('value = $computedValue');
  } on String catch (error) {
    print('catched $error');
  } finally {
    print('finally');
  }
}
