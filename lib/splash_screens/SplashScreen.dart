import 'package:acmcssdeadline/constants.dart';
import 'package:acmcssdeadline/onboarding_pages/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash-screen-page";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

Widget mainLogo(String mainLogoPath) {
  return Hero(
    tag: 'logo',
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image.asset(
        mainLogoPath,
        height: 250.0,
        width: 250.0,
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget subLogos(String subLogosPath) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image.asset(
        subLogosPath,
        fit: BoxFit.contain,
      ),
    ),
  );
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    new Future.delayed(Duration(milliseconds: 5000)).then((val) {
      Navigator.pushReplacementNamed(
        context,
        OnboardingScreen.routeName,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: LightTheme,
      //backgroundColor: Colors.black.withOpacity(0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          mainLogo('assets/images/acm.png'),
          Row(
            children: <Widget>[
              subLogos('assets/images/c++.png'),
              subLogos('assets/images/java.png'),
              subLogos('assets/images/python.png'),
            ],
          ),
        ],
      ),
    );
  }
}