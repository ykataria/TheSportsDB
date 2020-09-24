import 'package:flutter/material.dart';
import '../ui_components/countryComponent.dart';
import '../screens/countryLeagues.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> countryList = [
    "India",
    "United States",
    "Australia",
    "China",
    "Argentina",
    "Canada"
  ];

  loadCountryLeague(String countryName) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CountryLeagues(countryName)));
  }

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;

    print("Height : $_height and width : $_width");
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: _height * 0.12,
            ),
            Text(
              "The Sports DB",
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: _height * 0.12,
            ),
            countryComponent(_height, _width, "India", loadCountryLeague),
            SizedBox(height: 20.0),
            countryComponent(_height, _width, "United States", loadCountryLeague),
            SizedBox(height: 20.0),
            countryComponent(_height, _width, "Australia", loadCountryLeague),
            SizedBox(height: 20.0),
            countryComponent(_height, _width, "China", loadCountryLeague),
            SizedBox(height: 20.0),
            countryComponent(_height, _width, "Argentina", loadCountryLeague),
            SizedBox(height: 20.0),
            countryComponent(_height, _width, "Canada", loadCountryLeague),
          ],
        ),
      ),
    );
  }
}
