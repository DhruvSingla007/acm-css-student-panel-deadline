import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget SponsorsGridTile({
  @required String sponsorName,
  @required String imageUrl,
  @required BuildContext context,
}) {
  return Card(
    //color: Colors.grey[700],
    elevation: 10,
    child: GridTile(
      child: Column(
        children: <Widget>[
          Container(
            child: Expanded(
              flex: 4,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) =>
                    Center(child: Container(
                      width: 100.0, height: 50.0, child: Center(child: Text(
                      'Loading...',),),),),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(sponsorName,style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    ),
  );
}
