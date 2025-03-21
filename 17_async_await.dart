void main() async{
  // Future<ProcessData> createData((){  ---> Using Future method --> Not that readable
  //   return _LoadIdFromDisk.then((id){
  //     return _fetchNetworkData(id);
  //   }).then((data){
  //     return ProcessData(data);
  //   })
  // })
    ProcessData processedData = await createData();
    print("Processed Data: ${processedData.data}");

}
Future<ProcessData> createData() async{
    final id = await _loadIdFromDisk();
    final data = await _fetchNetworkData(id);
    return ProcessData(data);
}
Future<int> _loadIdFromDisk() async {
  await Future.delayed(Duration(seconds: 1)); // Simulating delay
  return 42; // Example ID
}//func to load id from disk

// Simulates fetching data from a network using an ID
Future<String> _fetchNetworkData(int id) async {
  await Future.delayed(Duration(seconds: 2)); // Simulating network delay
  return "Network data for ID $id"; // Example fetched data
}

class ProcessData{
  final String data;
  ProcessData(this.data);
}