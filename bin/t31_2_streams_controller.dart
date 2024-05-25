import 'dart:async';

// use a StreamController for a finer stream management
// or if you need to add events from various sources
Stream<int> createNumberStreamUsingController() {
  late StreamController<int> controller;
  Timer? timer;
  var counter = 0;

  // functions can be defined inside other functions,
  // their visibility is only local though.

  // (_) means it doesn't care about the parameter
  void tick(_) {
    controller.add(counter++);
    if (counter >= 3) {
      timer?.cancel();
      controller.close();
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), tick);
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  controller = StreamController<int>(
    // passing a function by its name is called tear off
    onListen: startTimer,
    onResume: startTimer,
    onPause: stopTimer,
    onCancel: stopTimer,
  );

  return controller.stream;
}

void main() async {
  // await doesn't stop while waiting,
  // it marks a code that will be executed later.
  // The control flow continues after the await
  // until the condition it was waiting for happens,
  // then the enclosed code is executed.
  await for (final event in createNumberStreamUsingController()) {
    print('controller next value: $event');
  }
}
