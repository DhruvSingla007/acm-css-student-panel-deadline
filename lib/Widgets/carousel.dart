import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomePageCarousel extends StatelessWidget {
  final String imageUrl_1;
  final String imageUrl_2;
  final String imageUrl_3;
  final String imageUrl_4;
  final String imageUrl_5;

  HomePageCarousel({
    @required this.imageUrl_1,
    @required this.imageUrl_2,
    @required this.imageUrl_3,
    @required this.imageUrl_4,
    @required this.imageUrl_5,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250.0,
        width: 300.0,
        child: Carousel(
          images: [
            CachedNetworkImage(
              fit: BoxFit.fitHeight,
              //height: 300.0,
              imageUrl: imageUrl_1,
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
            CachedNetworkImage(
              fit: BoxFit.fitHeight,
              //height: 300.0,
              imageUrl: imageUrl_2,
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
            CachedNetworkImage(
              fit: BoxFit.fitHeight,
              //height: 300.0,
              imageUrl: imageUrl_3,
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
            CachedNetworkImage(
              fit: BoxFit.fitHeight,
              //height: 300.0,
              imageUrl: imageUrl_4,
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
            CachedNetworkImage(
              fit: BoxFit.fitHeight,
              //height: 300.0,
              imageUrl: imageUrl_5,
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
          ],
          boxFit: BoxFit.contain,
          dotSize: 5.0,
          dotSpacing: 15.0,
          dotColor: Colors.white,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.black54.withOpacity(0.4),
          borderRadius: false,
          moveIndicatorFromBottom: 180.0,
          noRadiusForIndicator: true,
          overlayShadow: true,
          overlayShadowColors: Colors.black,
          overlayShadowSize: 0.7,
        ));
  }
}
