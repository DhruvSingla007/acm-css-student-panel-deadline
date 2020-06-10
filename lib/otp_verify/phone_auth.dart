
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:acmcssdeadline/otp_verify/otp_screen.dart';
import 'package:acmcssdeadline/constants.dart';

class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final _OtpVerifyFormKey = GlobalKey<FormState>();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.only(left: 8.0, top: 30),
      alignment: Alignment.center,
      child: new RaisedButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: CustomTheme,
        onPressed: () => {},
        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                child: new FlatButton(
                  onPressed: () {
                    print("pressed");
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext bc) {
                          print("VALID CC: $isValid");

                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter state) {
                            return Container(
                              padding: EdgeInsets.all(16),
                              height: MediaQuery.of(context).size.height * 0.7,
                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'LOGIN',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Text(
                                    'Verify your number from here',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: TextFormField(
                                      key: _OtpVerifyFormKey,
                                      keyboardType: TextInputType.number,
                                      controller: _phoneNumberController,
                                      autofocus: true,
                                      onChanged: (text) {
                                        validate(state);
                                      },
                                      decoration: InputDecoration(
                                        labelText: "10 digit mobile number",
                                        prefix: Container(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            "+91",
                                            style: TextStyle(
                                              //color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      autovalidate: true,
                                      autocorrect: false,
                                      maxLengthEnforced: true,
                                      validator: (value) {
                                        return !isValid
                                            ? 'Please provide a valid 10 digit phone number'
                                            : null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(16),
                                    child: Center(
                                      child: SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width *
                                            0.85,
                                        child: RaisedButton(
                                          color: !isValid
                                              ? CustomTheme
                                              .withOpacity(0.5)
                                              : CustomTheme,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(20.0)),
                                          child: Text(
                                            !isValid
                                                ? "ENTER PHONE NUMBER"
                                                : "CONTINUE",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            if (isValid) {
                                              Firestore.instance
                                                  .collection('contacts')
                                                  .document(
                                                  _phoneNumberController
                                                      .text
                                                      .toString()
                                                      .trim())
                                                  .setData({
                                                'Phone No.':
                                                _phoneNumberController.text
                                                    .toString()
                                                    .trim()
                                              });
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        OTPScreen(
                                                          mobileNumber:
                                                          _phoneNumberController
                                                              .text,
                                                        ),
                                                  ));
                                            } else {
                                              validate(state);
                                            }
                                          },
                                          padding: EdgeInsets.all(16.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                        });
                  },
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Verify",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}