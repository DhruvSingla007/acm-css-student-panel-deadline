import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/Widgets/carousel.dart';
import 'package:acmcssdeadline/Widgets/drawer.dart';
import 'package:acmcssdeadline/Widgets/icon_card.dart';
import 'package:acmcssdeadline/Widgets/image_cards.dart';
import 'package:acmcssdeadline/Widgets/moving_text.dart';
import 'package:acmcssdeadline/constants.dart';
import 'package:acmcssdeadline/pages/sponsors_page.dart';
import 'package:acmcssdeadline/pages/team_members/members_page.dart';
import 'package:acmcssdeadline/pages/workshops/workshops_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'events_page.dart';
import 'news/news_page.dart';
import 'sessions/sessions_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home-page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String notificationText = "No new notifications";

  String imageCarouselUrl_1 = "";
  String imageCarouselUrl_2 = "";
  String imageCarouselUrl_3 = "";
  String imageCarouselUrl_4 = "";
  String imageCarouselUrl_5 = "";

  String upcomingEventPicUrl_1 = "";
  String upcomingEventPicUrl_2 = "";
  String upcomingEventPicUrl_3 = "";
  String upcomingEventPicUrl_4 = "";
  String upcomingEventPicUrl_5 = "";

  bool isLoading = false;

  Future<void> getNotificationText() async {
    setState(() {
      isLoading = true;
    });

    DocumentReference docRef = Firestore.instance
        .collection('notifications')
        .document('currentNotifications');
    DocumentSnapshot docSnapshot = await docRef.get();

    setState(() {
      notificationText = docSnapshot.data['Notification_1'];
    });

    setState(() {
      isLoading = false;
    });
  }

  Future<void> getCarouselImages() async {
    setState(() {
      isLoading = true;
    });

    DocumentReference docRef =
        Firestore.instance.collection('carouselsImages').document('images');
    DocumentSnapshot docSnapshot = await docRef.get();

    setState(() {
      imageCarouselUrl_1 = docSnapshot.data['image_1'];
      imageCarouselUrl_2 = docSnapshot.data['image_2'];
      imageCarouselUrl_3 = docSnapshot.data['image_3'];
      imageCarouselUrl_4 = docSnapshot.data['image_4'];
      imageCarouselUrl_5 = docSnapshot.data['image_5'];
    });

    setState(() {
      isLoading = false;
    });
  }

  Future<void> getUpcomingEventsImages() async {
    setState(() {
      isLoading = true;
    });

    DocumentReference docRef =
        Firestore.instance.collection('upcomingEvents').document('images');
    DocumentSnapshot docSnapshot = await docRef.get();

    setState(() {
      upcomingEventPicUrl_1 = docSnapshot.data['image_1'];
      upcomingEventPicUrl_2 = docSnapshot.data['image_2'];
      upcomingEventPicUrl_3 = docSnapshot.data['image_3'];
      upcomingEventPicUrl_4 = docSnapshot.data['image_4'];
      upcomingEventPicUrl_5 = docSnapshot.data['image_5'];
    });

    setState(() {
      isLoading = false;
    });
  }

  Future<bool> _onWillPop() {
    Alert(
      style: AlertStyle(
        backgroundColor: Colors.black,
        titleStyle: TextStyle(color: Colors.white),
        descStyle: TextStyle(color: Colors.white),
      ),
      context: context,
      type: AlertType.error,
      title: "Exit",
      desc: "Do you want to exit the app ?",
      buttons: [
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(false),
          gradient: LinearGradient(colors: [
            Color(0xFF20BF55),
            Color(0xFF01BAEF),
          ]),
        ),
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => exit(0),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNotificationText();
    getCarouselImages();
    getUpcomingEventsImages();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            appbarLabelHomePage,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          centerTitle: true,
        ),
        drawer: HomePageDrawer(),
        body: ListView(
          children: <Widget>[
            HomePageCarousel(
              imageUrl_1: imageCarouselUrl_1,
              imageUrl_2: imageCarouselUrl_2,
              imageUrl_3: imageCarouselUrl_3,
              imageUrl_4: imageCarouselUrl_4,
              imageUrl_5: imageCarouselUrl_5,
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconCard(
                  iconData: Icons.event_note,
                  text: 'Events',
                  function: () =>
                      Navigator.pushNamed(context, EventsPage.routeName),
                ),
                IconCard(
                  iconData: Icons.chrome_reader_mode,
                  text: 'Workshops',
                  function: () =>
                      Navigator.pushNamed(context, WorkshopsPage.routeName),
                ),
                IconCard(
                  iconData: Icons.apps,
                  text: 'Sessions',
                  function: () =>
                      Navigator.pushNamed(context, SessionsPage.routeName),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconCard(
                  iconData: Icons.group,
                  text: 'Sponsors',
                  function: () =>
                      Navigator.pushNamed(context, SponsorsPage.routeName),
                ),
                IconCard(
                  iconData: Icons.chat,
                  text: 'News',
                  function: () =>
                      Navigator.pushNamed(context, NewsPage.routeName),
                ),
                IconCard(
                  iconData: Icons.group_work,
                  text: 'Team',
                  function: () =>
                      Navigator.pushNamed(context, TeamMembersPage.routeName),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                color: Colors.grey[800],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Upcoming Events',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 250.0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    ImageCards(
                      imageUrl: upcomingEventPicUrl_1,
                    ),
                    ImageCards(
                      imageUrl: upcomingEventPicUrl_2,
                    ),
                    ImageCards(
                      imageUrl: upcomingEventPicUrl_3,
                    ),
                    ImageCards(
                      imageUrl: upcomingEventPicUrl_4,
                    ),
                    ImageCards(
                      imageUrl: upcomingEventPicUrl_5,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                color: Colors.grey[800],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Notifications',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 25.0,
                  child: ScrollingText(
                    text: notificationText,
                    textStyle: TextStyle(
                      fontSize: 14,
                      color: greenColor,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
