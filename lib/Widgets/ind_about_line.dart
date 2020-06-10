import 'package:flutter/material.dart';
import 'package:acmcssdeadline/constants.dart';

Widget aboutLine() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 8.0,
    ),
    child: Center(
      child: Text(
        'About',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Montserrat',
          color: CustomTheme,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    ),
  );
}
