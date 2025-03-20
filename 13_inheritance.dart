void main(){

  // Creating an instance of President and calling the 'role' method
  President president = President(name: "Anokhi");
  president.role();

  VicePresident vicepresident = VicePresident(name: "Saumya");
  vicepresident.role();

  TechincalLead technicallead = TechincalLead(name: "Dhyan");
  technicallead.role();

  Executives treasurer = Treasurer(name: "Diya");
  (treasurer as Treasurer).role();  // Casting Executives to Treasurer to access its 'role' method

}

class Executives{
  void role(){
    print("Your role: ");
  }
}

class President extends Executives{

  String? name;
  President({this.name}){
    // Calling the role method from Executives class
    super.role(); 
  }

  // Overriding the role method to print a custom message for President
  void role(){
    print("Handles and manages all departments.");
  }

}

class VicePresident extends Executives{

  String? name;
  VicePresident({this.name}){
    super.role();
  }

  void role(){
    print("Works with other officials to execute permission related tasks");
  }

}

class TechincalLead extends Executives{

  String? name;
  TechincalLead({this.name}){
    super.role();
  }

  void role(){
    print("Handles all tech event and workshops.");
  }

}

class Treasurer extends Executives{

  String? name;
  Treasurer({this.name}){
    super.role();
  }

  void role(){
    print("Manages money related stuff.");
  }

}