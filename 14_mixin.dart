void main(){
  member mem = member();
  mem.introduce();
  mem.role();
}

// Defining an abstract class to serve as an interface for club members
abstract class clubMember{
  String get name;
  void introduce();
}

// Defining a mixin to provide additional functionality for club members
mixin Role{
  void role(){
    print("Organizing an event.");
  }
  void greetings(){
    print("Hello there.");
  }
}

class member with Role implements clubMember{
  //Need to be implemented
  @override
  String get name => "XYZ";

  @override
  void introduce(){
    print("Hi I am ${name}");
  }
}
