void main(){

  int age = 18;

  // Check if the age is less than or equal to 0, or greater than or equal to 200
  if(age<=0 || age >=200){
    print('''
      You are not born yet !!!
      or already dead.
    ''');
  }

  // Check if the age is exactly 18
  else if(age==18){
    print("Yayyy, You are going to vote for first time");
  }

  else{
    print("You are eligible for voting.");
  }

  dynamic word = "ENCODE";

  if(word is! String){
    // If 'word' is not a string, print this message
    print("This is not a string.");
  }
  else{
    // If 'word' is not a string, print this message
    print("This is a string");
  }

}