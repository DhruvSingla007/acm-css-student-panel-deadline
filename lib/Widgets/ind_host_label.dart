import 'package:flutter/material.dart';
import 'package:acmcssdeadline/constants.dart';

Widget indHostLabel({@required String hostName}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10.0,
      right: 10.0,
      bottom: 15.0,
      top: 0.0,
    ),
    child: Text(
      'Event Host : $hostName',
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: greenColor,
        fontStyle: FontStyle.italic,
        fontSize: 15.0,
      ),
    ),
  );
}
