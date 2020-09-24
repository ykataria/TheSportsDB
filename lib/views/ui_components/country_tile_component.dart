/*
  This is the component used by the HomeScreen to display the list Tile
  of the country list.
  ----------------------------
  Function takes following parameters:
  1. screenHeight: height of the screen
  2. screenWidth: Width of the screen
  3. country name: name of the country to be displayed
  4. pressedFunction: function to call when button is pressed
*/

import 'package:flutter/material.dart';


Widget countryComponent(
    double screenHeight, double screenWidth, String countryName, pressedFunction) {
  return SizedBox(
    width: screenWidth * 0.85,
    height: 50.0,
    child: FlatButton(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
      color: Colors.white60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            countryName,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.arrow_forward,
            size: 30.0,
          )
        ],
      ),
      onPressed: (){
        pressedFunction(countryName);
      }
    ),
  );
}
