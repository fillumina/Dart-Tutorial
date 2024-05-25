import 'dart:async';

// zones can be useful to create controlled environments with
// special characteristics.

void main(List<String> args) {
  // create a guarded, distinct and modifiable environment
  runZonedGuarded(() {
    Future.delayed(const Duration(seconds: 2), () {
      // the message is printed even after the exception
      print('delayed message');
    });
    print('A');
    print('B');
    throw Exception();
  }, zoneSpecification: ZoneSpecification(
    // modify the print behavior within the zone
    print: (self, parent, zone, line) {
      parent.print(zone, 'modified $line');
    },
  ), (error, stack) {
    // handle the exception (i.e. send a report)
    print('exception handler for $error');
  });
}
