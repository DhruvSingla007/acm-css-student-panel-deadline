import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/Widgets/ind_listTile.dart';
import 'package:acmcssdeadline/constants.dart';
import 'package:acmcssdeadline/pages/sessions/ind_session_page.dart';

class SessionsPage extends StatefulWidget {

  static const String routeName = "/sessions-page";
  @override
  _SessionsPageState createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {

  final _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Sessions'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            StreamBuilder(
              stream: _fireStore
                  .collection(fireStoreSessionsCollectionLabel)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final sessions = snapshot.data.documents;
                  List<IndListTile> sessionListTiles = [];
                  for (var session in sessions) {
                    print(session);
                    final sessionName = session.data[firestoreNameLabel];
                    final sessionDate = session.data[firestoreDateLabel];

                    final eventListTile = IndListTile(
                      name: sessionName,
                      date: sessionDate,
                      onTapFunction: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IndSessionPage(
                            documentSnapshot: session,
                          ),
                        ),
                      ),
                    );

                    sessionListTiles.add(eventListTile);
                  }
                  return Column(
                    children: sessionListTiles,
                  );
                }
                return Center(
                  child: Container(
                    child: Center(
                      child: Text(
                        'No sessions available',
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
