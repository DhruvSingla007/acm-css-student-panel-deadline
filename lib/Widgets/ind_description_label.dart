import 'package:flutter/material.dart';

Widget indDescriptionLabel({@required String description}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
    child: Text(
      description,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontFamily: 'Montserrat',
        //color: Colors.black,
        fontSize: 15.0,
      ),
    ),
  );
}
