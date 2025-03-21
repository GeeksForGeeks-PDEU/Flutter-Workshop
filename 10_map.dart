void main(){

  Map<String, List<String>> F1 = {
    // Key is the team name, value is a list of driver names
    "Mercedes" : ["George Rusell","Valtteri Bottas"],
    "Ferrari" : ["Lewis Hamilton","Charles Leclerc"]
  };

  // Print the entire F1 map
  print(F1);

  // Access and print the list of drivers for Ferrari team
  print(F1["Ferrari"]);

  // Use forEach to iterate through the map and print each team and their drivers
  F1.forEach(
    (key, value) {
      print(key);
      for(int i=0; i<value.length; i++){
        print("\tDriver: ${value[i]}");
      }
    },
  );

}