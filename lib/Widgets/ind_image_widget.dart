import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget imageWidget({@required BuildContext context, @required String url}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: CachedNetworkImage(
        fit: BoxFit.fitHeight,
        //height: 300.0,
        imageUrl: url,
        placeholder: (context, url) => Center(
          child: Container(
            width: 100.0,
            height: 50.0,
            child: Center(
              child: Text('Loading...'),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      //color: Colors.black,
      height: 250.0,
      width: MediaQuery.of(context).size.width,
    ),
  );
}
