import 'package:flutter/material.dart';
import 'package:acmcssdeadline/constants.dart';

class IndListTile extends StatelessWidget {
  final String name;
  final String date;
  final Function onTapFunction;

  IndListTile({this.name, this.date, this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5.0,
        left: 10.0,
        right: 10.0,
        bottom: 5.0,
      ),
      child: Card(
        color: LightTheme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45.0),
        ),
        elevation: 8.0,
        child: ListTile(
          onTap: onTapFunction,
          leading: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.event_note,
                color: Colors.white,
                size: 20.0,
              ),
            ),
          ),
          title: Text(
            name,
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              "Date : $date",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ),
    );
  }
}