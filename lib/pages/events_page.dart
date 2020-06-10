import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/Widgets/ind_listTile.dart';
import 'package:acmcssdeadline/constants.dart';
import 'ind_event_page.dart';

class EventsPage extends StatefulWidget {
  static const String routeName = '/events-page';

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            StreamBuilder(
              stream: _fireStore
                  .collection(fireStoreEventCollectionLabel)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final events = snapshot.data.documents;
                  List<IndListTile> eventListTiles = [];
                  for (var event in events) {
                    print(event);
                    final eventName = event.data[firestoreNameLabel];
                    final eventDate = event.data[firestoreDateLabel];

                    final eventListTile = IndListTile(
                        date: eventDate,
                        name: eventName,
                        onTapFunction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IndEventPage(
                                documentSnapshot: event,
                              ),
                            ),
                          );
                        });

                    eventListTiles.add(eventListTile);
                  }
                  return Column(
                    children: eventListTiles,
                  );
                }
                return Center(
                  child: Container(
                    child: Text(
                      'No events available', style: TextStyle(fontFamily: 'Montserrat'),
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
