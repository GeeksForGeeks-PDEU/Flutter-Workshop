void main(){
  greetings();
  int c = sum(10,2);
  print(c); // Output: 12

  c = calculator(10, 2, sum); // Passing the sum function as a parameter
  print(c); // Output: 12
}

void greetings(){
  print("HI guys !!!"); // Output: HI guys !!!
}

int sum(int a, int b){
  return a+b; // Returns the sum of a and b
}

int calculator(int n1, int n2, Function cal){
  return cal(n1, n2); // Calls the passed function (cal) with n1 and n2
}