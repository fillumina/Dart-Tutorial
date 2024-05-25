// extension is a way to add methods to a class without touching the actual class

// adding a method to the String class
extension Fun on String {
  String smile() => "$this \u{1F60A}";
}

void main() {
  print("Hello World".smile());
}
