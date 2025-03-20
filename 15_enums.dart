void main(){

  Role member1 = Role(posi: clubPosition.Heads, name: "Mann");
  print(member1);
  Role member2 = Role(posi: clubPosition.values[1], name: "Devarsh");
  print(member2);

}

class Role{

  String name;
  clubPosition posi;

  // Constructor to initialize the name and position
  Role({required this.posi, required this.name});

  @override
  String toString(){
    String result = "Name: ";
    result += name;

    // Use a switch-case to append the role based on the position
    switch (posi) {
      case clubPosition.Executives:
        result += ", Role: Executive";
        break;
      case clubPosition.Heads:
        result += ", Role: Head";
        break;
      case clubPosition.Members:
        result+= ", Role: Member";
        break;
      default:
        print("Error"); // Handles unexpected position
        break;
    }

    return result;
  }

}

// Enum to define possible positions in the club
enum clubPosition{
  Executives,
  Heads,
  Members,
} 