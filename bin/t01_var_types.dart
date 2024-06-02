/*
Variables defined here are global to the file.
(This is a multiline comment.)
*/

// this is a single line comment.

// dart supports global variables but they should be used seldomly because
// of implications for testing, code maintainability and coherence.
// It is advised to use them only to keep constant values (const).

// define a string global variable with a value enclosed by single quotes
const String myGlobal = 'global var'; // a comment can follow a statement

// Dart allows aliases, here the int type can be aliased by MyInteger
typedef MyInteger = int;

void main(List<String> args) {
  /*
  Variables defined here a local to the function
  */

  // strings can be defined with single '' or double quotes ""
  // single quote should be used unless a quote is present in the string
  String name = 'Pippo';

  // runtimeType is a field present on any object
  assert(name.runtimeType == String);

  // this string contains a quote
  String anotherName = "That's a quote";
  assert(anotherName.runtimeType == String);

  // a variable can be always reassigned with a new value with the same type
  name = 'Pluto';

  // strings supports templating
  String hello = 'Hello $name';
  assert(hello == 'Hello Pluto');

  // for complex operation use {} in templates
  String bigHello = 'HELLO ${name.toUpperCase()}';
  assert(bigHello == 'HELLO PLUTO');

  // templates can embed complex expressions
  assert('${name.runtimeType}, ${3 + 2}' == 'String, 5');

  // defining an integer
  int intValue = 3;
  assert(intValue.runtimeType == int);

  // use the typedef alias for int
  MyInteger v = 12;
  assert(v.runtimeType == int);
  assert(v.runtimeType == MyInteger);

  // define a double
  double d = 12.3;
  assert(d.runtimeType == double);

  // num is the parent of both int and double (there aren't other number types)
  num aInt = 12;
  num aDouble = 34.4;
  assert(aInt == 12 && aDouble == 34.4);
  assert(aInt.runtimeType == int);
  assert(aDouble.runtimeType == double);

  // initialize multiple variables of the same type at once
  // note that y is not assigned so it defaults to null
  // the 'int?' means that the int variables can be null
  int? x = 1, y, z = 3;

  // the following ignore:.. line is to silence the automatic hint of VSCode
  // ignore: unnecessary_null_comparison
  assert(x == 1 && y == null && z == 3);

  // multiline strings preserve indentation
  // a multiline string can contain single or double quotes and templates
  // the first newline after """ is ignored but might be useful to keep
  // indentation
  String multiLineString = """
    this' is a 
    multi line
    "string",
    note that the tab is kept.
    template: $x
  """;

  // using template to print the value of the variable
  print('multilineString:\n$multiLineString');

  // implicit type: age type is int
  var age = 23;
  assert(age.runtimeType == int);

  // a variable declared with var has a type and cannot be reassigned
  // this is wrong:
  //age = 'hello';

  // explicit types
  int weight = 90;
  assert(weight.runtimeType == int);

  double height = 193.4;
  assert(height.runtimeType == double);

  int hex = 0xA1;
  assert(hex.runtimeType == int);

  double scientificNotation = 0.123e10;
  assert(scientificNotation.runtimeType == double);

  // to force double use the .0
  var doubleValueUsingDotZero = 12.0;
  assert(doubleValueUsingDotZero.runtimeType == double);

  // final means that the variable is immutable
  final double speed = 12;
  assert(speed.runtimeType == double);

  // constant is immutable too and resolved at compile time
  const double pi = 3.1515;
  assert(pi.runtimeType == double);

  // in both const and final the type can be omitted (just like var)
  const loops = 3;
  assert(loops.runtimeType == int);

  // methods can be applied to every objects
  var caps = 'hello world'.toUpperCase();
  assert(caps == 'HELLO WORLD');

  // numbers are objects too
  assert(-12.sign == -1);

  // booleans
  bool isTrue = true;
  var isFalse = false;
  assert(isTrue && !isFalse);

  bool equalityBetweenStrings = "same" == 'same';
  assert(equalityBetweenStrings);

  // dynamic is not a type, it disables type checking
  dynamic dynamicValue = 'something';
  assert(dynamicValue.runtimeType == String);

  // a dynamic variable can accept different types
  dynamicValue = 12;
  assert(dynamicValue.runtimeType == int);

  dynamicValue = 12.0;
  assert(dynamicValue.runtimeType == double);

  dynamicValue = true;
  assert(dynamicValue.runtimeType == bool);

  // object it's the father of all other classes
  Object obj = 'something';
  assert(obj.runtimeType == String);
  // a variable of type object can be reassigned (b/c Object is their parent)
  obj = 12;
  assert(obj.runtimeType == int);

  // normal variable can be set to other values const and final cannot
  name = "can be redifined";
  height = 56.78;

  // character extracted from a string are still strings (no char)
  assert('hello'[1] == 'e');

  // using unicode
  print('happy face: \u{1F60A}');

  // also
  print('another happy face: ${String.fromCharCode(0x1F60A)}');

  // use StringBuffer to compose strings dynamically
  // (new is optional when instantiating a new object)
  final buf = /* new */ StringBuffer();
  // double dots allows to use fluent interface even when result is void
  buf
    ..write('hello')
    ..write(' ')
    ..write('world');
  assert(buf.toString() == 'hello world');

  // using dots assings only the first operation to buffer:
  final alpha = StringBuffer()
    ..write('alpha')
    ..toString(); // the result of toString() is lost because of ..
  assert(alpha.runtimeType == StringBuffer);
  assert(alpha.toString() == 'alpha');

  // parse() throws an exception if fails
  final int parsedInt = int.parse('12');
  assert(parsedInt == 12);

  // tryParse() assings null if fails, the ? means that the variable _might_ be null
  final int? valueOrNull = int.tryParse('12.3');
  assert(valueOrNull == null);

  // if the type cannot be inferred it must be provided (cannot use var here)
  // ignore: avoid_init_to_null
  double? mightBeNull = null;
  assert(mightBeNull.runtimeType == null.runtimeType);

  // void is for a variable that cannot be used
  void empty = 'a';
}
