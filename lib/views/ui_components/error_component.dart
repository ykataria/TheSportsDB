import 'package:flutter/material.dart';

// component when there is any error
class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.red,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          RaisedButton(
            color: Colors.red[900],
            child: Text(
              'Retry',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: onRetryPressed,
          ),
        ],
      ),
    );
  }
}
