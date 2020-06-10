import 'package:flutter/material.dart';

import 'package:acmcssdeadline/otp_verify/phone_auth.dart';

class LoginPageOtp extends StatelessWidget {
  const LoginPageOtp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verify OTP Screen",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              fontFamily: 'Montserrat'),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: new Column(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/images/p4.png',
                    fit: BoxFit.contain,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Verify your phone number",
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 20),
                ),
                SizedBox(
                  height: 50,
                ),
                PhoneLogin()
              ],
            ),
          ),
        ),
      ),
    );
  }
}