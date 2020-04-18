import 'package:flutter/material.dart';
import 'package:acmcssdeadline/constants.dart';

Widget buildInfoBoxes({Icon icon, String value}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 50.0,
      vertical: 4.0,
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.black54,
        border: Border.all(
          color: greenColor,
        ),
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListTile(
          leading: icon,
          title: Text(
            value,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    ),
  );
}
