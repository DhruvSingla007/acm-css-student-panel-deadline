import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/Widgets/ind_news_tile.dart';

import '../../constants.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = "/news-page";

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _fireStore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            StreamBuilder(
              stream: _fireStore
                  .collection(fireStoreNewsCollectionLabel)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final newsList = snapshot.data.documents;
                  List<NewsListTile> newsListTiles = [];
                  for (var news in newsList) {
                    final newsImageUrl = news.data[firestoreImageUrl];
                    final newsTitle = news.data[firestoreNewsTitleLabel];
                    final newsDescription =
                        news.data[firestoreNewsDescriptionLabel];

                    final newsListTile = NewsListTile(
                      imageUrl: newsImageUrl,
                      newsTitle: newsTitle,
                      newsDescription: newsDescription,
                    );

                    newsListTiles.add(newsListTile);
                  }
                  return Column(
                    children: newsListTiles,
                  );
                }
                return Center(
                  child: Container(
                    child: Center(
                      child: Text(
                        'Unexpected Error Occurred',
                           style: TextStyle(fontFamily: 'Montserrat'),
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
