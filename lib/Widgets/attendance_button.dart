import 'package:flutter/material.dart';
import 'package:acmcssdeadline/constants.dart';

Widget attendanceButton({@required Function function}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        onPressed: function,
        color: greenColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Attendance',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    ),
  );
}
