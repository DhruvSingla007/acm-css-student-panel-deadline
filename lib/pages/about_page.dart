import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/Widgets/about_text.dart';
import '../constants.dart';

class AboutPage extends StatefulWidget {
  static const String routeName = "/about-page";

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final _fireStore = Firestore.instance;

  String aboutInfoText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          StreamBuilder(
            stream: _fireStore
                .collection(fireStoreAboutCollectionLabel)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final aboutInfo = snapshot.data.documents;
                aboutInfoText = aboutInfo[0].data[firestoreNameLabel];
              } else {
                aboutInfoText = "Unexpected Error Occurred";
              }
              return aboutLineText(
                info: aboutInfoText,
                context: context,
              );
            },
          ),
        ],
      ),
    );
  }
}
