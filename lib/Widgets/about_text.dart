import 'package:flutter/material.dart';
import 'package:acmcssdeadline/constants.dart';

Widget aboutLineText({
  @required String info,
  @required BuildContext context,
}) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        height: 250.0,
        child: Image.asset(mainLogoImagePath),
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          bottom: 5.0,
          right: 8.0,
        ),
        child: Center(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Center(
              child: Text(
                info,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                //textAlign: TextAlign.justify,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
