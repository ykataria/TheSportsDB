import 'package:http/http.dart' as http;


Future testingCalls(String functionName) async {

  print("The call is from : $functionName");
  var response = await http.get(
      "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?c=India");

  if (response.statusCode == 200)
  {
    print('APi returned 200');
    return response;
  }
  else {
    print("API thows some error");
    throw Exception('Failed to load the data');
  }
}