// Dart doesn't jave arrays and uses lists for the same purpose

void main() {
  List intList = [0, 3, 12, -10];
  assert(intList.runtimeType == List);
  assert(intList[0] == 0);
  assert(intList[1] == 3);
  assert(intList[2] == 12);
  assert(intList[3] == -10);
  assert(intList.isEmpty == false);
  assert(intList.length == 4);

  // modify the 0th index in place
  intList[0] = 6666;
  assert(intList[0] == 6666);

  // add a new item
  intList.add(9);
  assert(intList[4] == 9);

  var l = List.from(const [0, 1, 3]);
  assert(l[0] == 0);

  // defines an immutable list of strings
  const List immutable = ['alfa', 'beta', 'gamma'];
  assert(immutable.runtimeType == List);
  // this would produce a runtime error
  //immutable.add('delta');
}
