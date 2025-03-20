void main(){

  int num = -50;
  print(num*2); // Output: -100
  print(num.abs()); // Output: 50

  double decimal = 0.5;
  print(decimal.ceil()); // Output: 1

  String name = "ENCODE Fam";
  print("Hey " + name); // Output: Hey ENCODE Fam

  bool check = true;
  print(check); // Output: true

  dynamic cgpa = 9.62;
  print('${cgpa}, ${cgpa.runtimeType}'); // Output: 9.62, double

  var a = 123;
  print(a.runtimeType); // Output: int

  // cgpa is declared as dynamic, so it can be reassigned to a string
  cgpa = "Hello World";  // Valid because 'cgpa' is dynamic

  // a is declared with var, so its type was inferred as 'int' initially,
  // a = "Hello World"; 

  // Declaring a constant variable with 'const' means its value is determined at compile-time and cannot be changed.
  const constantValue = 1;
  // Declaring a final variable with 'final' means its value is assigned only once and cannot be reassigned after initialization.
  final finalValue = 10; 

  print(constantValue); // Output: 1 (constant value, cannot be changed)
  print(finalValue); // Output: 10 (final value, can only be set once)

}