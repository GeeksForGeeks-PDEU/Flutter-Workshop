void main(){

    String grade = "O";

    // Switch statement to check the value of 'grade'
    switch(grade){

        // Case for different type of grade, prints the corresponding message

        case "O" : { print("10 Points - Excillent"); }
        break;

        case "A+": {print("9 Points - Very Good");}
        break;

        case "A": {print("8 Points - Good");}
        break;

        case "B+": {print("7 Points - Better");}
        break;

        case "B": {print("6 Points - Pass");}
        break;

        // Default case if no match is found, prints "Fail"
        default: {print("Fail");}
        break;
        

    }
}