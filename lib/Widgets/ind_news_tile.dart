import 'package:acmcssdeadline/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsListTile extends StatelessWidget {
  final String newsTitle;
  final String newsDescription;
  final String imageUrl;

  NewsListTile({
    @required this.imageUrl,
    @required this.newsTitle,
    @required this.newsDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: LightTheme,
          elevation: 8.0,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => Center(
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Loading...',
                               style: TextStyle(fontFamily: 'Montserrat')
                          ),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 5.0,
                  right: 8.0,
                ),
                child: Center(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Center(
                      child: Text(
                        newsTitle,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        //textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Divider(
                  color: Colors.blueGrey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  right: 8.0,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    newsDescription,
                    textAlign: TextAlign.justify,
                      style: TextStyle(fontFamily: 'Montserrat',color: Colors.black)
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
