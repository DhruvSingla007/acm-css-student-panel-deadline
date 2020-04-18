import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCards extends StatelessWidget {
  final String imageUrl;

  ImageCards({
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          height: 200.0,
          child: CachedNetworkImage(
            fit: BoxFit.fitHeight,
            //height: 300.0,
            imageUrl: imageUrl,
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
        ),
      ),
    );
  }
}
