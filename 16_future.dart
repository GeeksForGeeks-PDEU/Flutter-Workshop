void main() async{
  
  //They represtent tresul of a asynchornous task that takes some time to complete
  // like a network request
  // HAs two tastes -> Uncompleted state (when request is made up untill a response comnes back)
  // completed stated -> future gets response value or error
  
//  method 1
  fetchLoaction().then((l) {
    print(l.name);
    print(l.loactionID);
  });
//  Use Async and await


  //whencomplete() method used when future is completed with/without (does't matter) error/not 
}

Future fetchLoaction(){
  const delay = Duration(seconds: 5);

  return Future.delayed(delay, (){
    return Locations("Kudasan", 20);
  }).catchError((err){
    print("This is the error: $err");
  });
}

class Locations{
  String? name;
  int? loactionID;
  
  Locations(this.name, this.loactionID);
}