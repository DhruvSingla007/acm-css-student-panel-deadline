import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/Widgets/member_listTile.dart';

import '../../constants.dart';

class AppCoordinatorsPage extends StatefulWidget {

  static const String routeName = "/app-development-team-page";

  @override
  _AppCoordinatorsPageState createState() => _AppCoordinatorsPageState();
}

class _AppCoordinatorsPageState extends State<AppCoordinatorsPage> {

  final _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Development Team'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            StreamBuilder(
              stream: _fireStore
                  .collection(fireStoreDevelopmentTeamCollectionLabel)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final members = snapshot.data.documents;
                  List<IndMemberListTile> memberListTiles = [];
                  for (var member in members) {
                    final memberName = member.data[firestoreTeamMemberNameLabel];
                    final memberContact = member.data[firestoreTeamMemberContactLabel];
                    final memberEmailID = member.data[firestoreTeamMemberEmailIDLabel];
                    final memberPosition = member.data[firestoreTeamMemberPositionLabel];
                    final memberPhotoUrl = member.data[firestoreImageUrl];

                    final memberListTile = IndMemberListTile(
                      imageUrl: memberPhotoUrl,
                      memberName: memberName,
                      memberContact: memberContact,
                      memberEmailID: memberEmailID,
                      memberPosition: memberPosition,
                    );

                    memberListTiles.add(memberListTile);
                  }
                  return Column(
                    children: memberListTiles,
                  );
                }
                return Center(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Unexpected Error Occurred',
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
