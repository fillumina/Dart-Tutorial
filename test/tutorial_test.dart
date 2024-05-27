import 'package:tutorial/tutorial.dart';
import 'package:test/test.dart';

// 'dart test' command consider all files ending with '_test.dart' as test

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}
