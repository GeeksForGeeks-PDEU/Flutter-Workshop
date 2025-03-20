void main(){

  // Creating an instance of the 'Club' class and calling the 'greetings' method
  Club("XYZ").greetings(); // Instance of Club

  // Declaring a final instance of 'Club' with the name "Encode" and calling the 'greetings' method
  final Club club = Club("Encode"); // Final Instance of Club 
  club.greetings(); // Output: "Hey We are Encode."

  print(Club.get_count());

}

class Club{
  
  String name;
  static int counter = 0; // Shared by all instances

  // Constructor to initialize the 'name' of the club
  Club(this.name){
    counter++;
  }

  void greetings(){
    print("Hey We are ${name}.");
  }

  // Static method to return the current count of Club instances
  static get_count(){
    return counter;
  }

}