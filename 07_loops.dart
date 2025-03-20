void main(){

  //For loop
  print("For loop");

  String word = "ENCODE";

  for(int i=0; i<word.length ; i++){
    // Print each character of the word one by one
    print("${word[i]}");
  }

  //While loop
  print("While loop");

  int i=0;
  while(i<6){
    // Print the character from the word in reverse order
    print(word[word.length-i-1]);
    i++;
  } 

  //Do-while loop
  do {
    // If 'i' equals 3, break out of the loop
    if(i == 3){
      break; 
      //i--; make sure i decrement before skipping the loop
      //continue; skip inside the loop
    }
    print("${i}");
    i--;
  } while (i>0);  // Continue the loop as long as 'i' is greater than 0


}