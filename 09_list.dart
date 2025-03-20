// ignore_for_file: equal_elements_in_set

void main(){

    //Growable Size list - list1: A list with initial values and the ability to grow dynamically
    List<int> list1 = [10, 15, 20, 25, 30]; 
    print("Growable List: $list1");

    // Multiple Data types in a list: A list that can hold elements of different data types
    List list2 = ["Encode", 1, "Best Coding club->", true, 11.0];
    print("Multiple Datatypes in a Single List: $list2");
    
    //Fixed Size list: A list of fixed size, created using List.filled 
    List list3 = new List.filled(3,0,growable: false);  // [0,0,0]   
    list3[0] = 10;
    list3[1] = 20;
    list3[2] = 15;
    print("Fixed Size List: $list3");

    //Cascade operator on list
    list1..add(35)..remove(10);

    // Accessing the first and last elements of the list
    int first = list1.first;       // Get first element
    int last = list1.last;         // Get last element
    print('First: $first, Last: $last');

    // A Set is an unordered collection of unique elements. Duplicates are automatically removed.
    Set names = {"Hi","Hello","Bye","Bye","Bye"};
    print(names);

}