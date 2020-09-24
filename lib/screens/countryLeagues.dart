import 'package:flutter/material.dart';
import '../repository/getCountryLeague.dart';


class CountryLeagues extends StatefulWidget {
  final countryName;
  CountryLeagues(this.countryName, {Key key}): super(key: key);

  @override
  _CountryLeaguesState createState() => _CountryLeaguesState();
}

class _CountryLeaguesState extends State<CountryLeagues> {


  void callAPI(String functionName) async
  {
    // testingCalls().then((value){
    //   print("Result is : $value");
    // }).catchError((error){
    //   print("Error is : $error");
    // });

    var resp = await testingCalls(functionName);

    print("status of $functionName is as follows : ${resp.statusCode}");
    print("This is testing to check if the await stops or not.....");
  }

  void callAPI2() async
  {

    var resp = await testingCalls("function 2");

    print("Function 2 got the result.");
  }

  @override
  void initState() {
    print('Getting the data for ${widget.countryName}');

    callAPI("A");
    print("This Is test for function above");
    callAPI("B");
    callAPI("C");
    callAPI("D");
    callAPI("E");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.countryName,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}