void main(){  
  Clubs encode = Clubs();
  // Calling the 'event' method of the 'Clubs' class
  encode.event();
  // Calling the 'skills_earned' method from the 'College' class
  print(encode.skills_earned());

}

abstract class College{
  // Abstract method 'event' that must be implemented by any class that extends 'College'
  void event();
  // Concrete method 'skills_earned' that returns an integer value
  int skills_earned(){
    return 3;
  }

}

class Clubs extends College{
  // Overriding the abstract 'event' method to provide the actual implementation
  @override
  void event() {
    print("Dart Workshop.");  // Prints the event being held by the club
  }
  
}