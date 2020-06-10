import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/Widgets/ind_listTile.dart';
import 'package:acmcssdeadline/constants.dart';
import 'package:acmcssdeadline/pages/workshops/ind_workshop_page.dart';

class WorkshopsPage extends StatefulWidget {
  static const String routeName = "/workshops-page";

  @override
  _WorkshopsPageState createState() => _WorkshopsPageState();
}

class _WorkshopsPageState extends State<WorkshopsPage> {
  final _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            StreamBuilder(
              stream: _fireStore
                  .collection(fireStoreWorkshopCollectionLabel)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final workshops = snapshot.data.documents;
                  List<IndListTile> workshopListTiles = [];
                  for (var workshop in workshops) {
                    //print(workshop);
                    final workshopName = workshop.data[firestoreNameLabel];
                    final workshopDate = workshop.data[firestoreDateLabel];

                    final workshopListTile = IndListTile(
                      date: workshopDate,
                      name: workshopName,
                      onTapFunction: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IndWorkshopPage(
                            documentSnapshot: workshop,
                          ),
                        ),
                      ),
                    );

                    workshopListTiles.add(workshopListTile);
                  }
                  return Column(
                    children: workshopListTiles,
                  );
                }
                return Center(
                  child: Container(
                    child: Center(
                      child: Text(
                        'No workshops available',
                           style: TextStyle(fontFamily: 'Montserrat')
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
