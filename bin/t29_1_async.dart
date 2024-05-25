// async await keywords help manage future code in a more natural way

// 'async' functions always create and return a Future (even if the return is
// missing) and the type of the generics is the type the function return
// (void in this case).
// async methods usually contain code that will be executed after an event in
// the future so they should be called with the 'await' keyword that signal
// that the caller should *wait* for the function to actually complete.
Future<void> asyncFunction() async {
  // this code is executed synchronously
  print('inside asyncFunction()');
  await Future.delayed(
      // the code in the Future will be executed asynchronously even if
      // the dealy is actually 0 seconds.
      Duration.zero,
      () => print('after the event in asyncFunction()'));
}

void main(List<String> args) async {
  // calling asyncFunction without 'await' will not wait for it to finish
  asyncFunction();
  print('after calling asyncFunction()');

  // here we wait for asyncFunction() to finish
  await asyncFunction();
  print('end main()');
}
