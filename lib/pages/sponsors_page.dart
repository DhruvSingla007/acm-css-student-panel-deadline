import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/Widgets/sponsors_gridTile.dart';
import 'package:acmcssdeadline/constants.dart';

class SponsorsPage extends StatefulWidget {
  static const String routeName = "/sponsors-page";

  @override
  _SponsorsPageState createState() => _SponsorsPageState();
}

class _SponsorsPageState extends State<SponsorsPage> {
  final _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sponsors', style: TextStyle(fontFamily: 'Montserrat')),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          StreamBuilder(
              stream: _fireStore
                  .collection(fireStoreSponsorCollectionLabel)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final sponsors = snapshot.data.documents;
                  print(sponsors);
                  print(sponsors.length);

                  List<Widget> sponsorListTiles = [];
                  for (var sponsor in sponsors) {
                    final sponsorName = sponsor.data[firestoreNameLabel];
                    final sponsorsImageUrl = sponsor.data[firestoreImageUrl];

                    final sponsorListTile = SponsorsGridTile(
                      context: context,
                      imageUrl: sponsorsImageUrl,
                      sponsorName: sponsorName,
                    );

                    sponsorListTiles.add(sponsorListTile);
                  }

                  return GridView.count(
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    crossAxisCount: 2,
                    children: sponsorListTiles,
                    padding: EdgeInsets.all(5.0),
                  );
                } else
                  return Center(
                    child: Container(
                      child: Center(
                        child: Text(
                          'An unexpected error has occured.',
                             style: TextStyle(fontFamily: 'Montserrat'),
                        ),
                      ),
                    ),
                  );
              }),
        ],
      ),
    );
  }
}
