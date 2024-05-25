// any class with a const constructor can be used as an annotation

// contains the reflection API
import 'dart:mirrors';

// to create an annotation create a class with a constant constructor
class MyAnnotation {
  const MyAnnotation();
}

// use it like it was an instance of the annotation attached to the definition
// of another class (could be a method, a field, a parameter)
@MyAnnotation()
class Annotated {}

// In case the annotation doesn't need a parameter we can avoid having the () by
// defining a private class that cannot be instantiated outside the library
class _SomeAnnotation {
  const _SomeAnnotation();
}

// creates a public constant that refers to a _SomeAnnotation instance
const someAnnotation = _SomeAnnotation();

// using this instance as an annotation. not having parameters it doen't matter
// if all annotated classes share the same instance
@someAnnotation
class Test {}

// In case we need to use parameters we cannot use the same instance for all
// annotated definitions
class MyAnnotationWithParameter {
  final int number;
  final String string;

  const MyAnnotationWithParameter(this.number, this.string);

  @override
  String toString() => '$number: $string';
}

@MyAnnotationWithParameter(1, 'hello')
class Example {
  final double value;
  const Example({this.value = 10});
}

void main(List<String> args) {
  final ClassMirror testType = reflectClass(Test);
  var myAnnotation = testType.metadata.first.reflectee;
  assert(myAnnotation.runtimeType == _SomeAnnotation);

  // get a reflection object about the class Example
  final ClassMirror exampleType = reflectClass(Example);

  for (final InstanceMirror metadata in exampleType.metadata) {
    var myAnnotationWithParameters =
        metadata.reflectee as MyAnnotationWithParameter;
    assert(myAnnotationWithParameters.runtimeType == MyAnnotationWithParameter);
    assert(myAnnotationWithParameters.number == 1);
    assert(myAnnotationWithParameters.string == 'hello');
    assert('$myAnnotationWithParameters' == '1: hello');
  }
}
