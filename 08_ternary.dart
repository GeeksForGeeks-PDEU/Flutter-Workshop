import 'dart:io';

void main(){

  String? condition;
  print("Enter condition: ");
  // Read user input from the console and store it in the 'condition' variable
  condition = stdin.readLineSync();
  // Ternary operator: If 'condition' equals "True", print "True Condition", else print "False Condition"
  condition == "True" ? print("True Condition") : print("False Condition");

}