void main(){
  
  // BODMAS
  print(5+(40-2)/2*5);

  /*
    Null Safety
    // The '!' operator is used to tell the compiler that a nullable variable is definitely not null at that point in code.
    // The '?' allows a variable to hold a null value
  */

  String? word;

  word = "Dart";
  print(word.length); // Output: 4

  word = null;
  
  print(word?.length); // Output: null
  print(word!.length); // Throws runtime exception: "Null check operator used on a null value"

}
