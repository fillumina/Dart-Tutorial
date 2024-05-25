import 'dart:isolate';

// ports are a way for two isolates to communicate
// each isolate creates its own receiving port and send it to its partner
// in the form of the corresponding sending port. The exchange can happen
// using the paramter in the creation of the isolate.

// this is the execution code of the isolate
void setupIsolate(SendPort sendPort) async {
  final receivePort = ReceivePort();

  // send its own sendPort as its first message back
  sendPort.send(receivePort.sendPort);

  receivePort.listen((Object? message) async {
    // returns every message received
    sendPort.send('received $message');
  });
}

Future<void> main() async {
  // this port will receive the messages from the created isolate
  final receivePort = ReceivePort();
  final isolate =
      await Isolate.spawn<SendPort>(setupIsolate, receivePort.sendPort);

  await for (Object msg in receivePort) {
    if (msg is SendPort) {
      // the first message received is the sendPort
      SendPort sendPort = msg;
      // send some asynchronous messages to the isolate
      execute(sendPort);
      print('end execution');
    } else {
      print('got $msg');
      if (msg.toString().contains('exit')) {
        print('exiting');
        // properly terminate the isolate
        receivePort.close();
        isolate.kill();
      }
    }
  }

  print('end main()');
}

void execute(SendPort sendPort) async {
  // send some messages to the isolate
  for (String msg in ['hello', 'world', 'this', 'is', 'me', 'exit']) {
    await Future.delayed(Duration(seconds: 1), () {});
    sendPort.send(msg);
  }
}
