import 'dart:io';

// WARNING:
// vscode has some problem managing stdin and stdout, try using the terminal:
// dart t35_stdin_stdout.dart

void main(List<String> args) {
  stdout.writeln('insert a number:');
  final String number = stdin.readLineSync()!;
  final a = double.parse(number);
  stdout.writeln('the square is ${a * a}');
}
