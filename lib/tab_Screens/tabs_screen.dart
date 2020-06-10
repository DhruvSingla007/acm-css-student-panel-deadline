import 'package:acmcssdeadline/Widgets/drawer.dart';
import 'package:acmcssdeadline/pages/about_page.dart';
import 'package:acmcssdeadline/constants.dart';
import 'package:acmcssdeadline/pages/events_page.dart';
import 'package:acmcssdeadline/pages/news/news_page.dart';
import 'package:acmcssdeadline/pages/workshops/workshops_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class TabScreen extends StatefulWidget {
  static const String routeName = "/tab-screen";

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  String launchUrl = "";
  final List<Map<String, Object>> _pages = [
    {
      'page': NewsPage(),
      'appBarTitle': 'Timeline',
    },
    {
      'page': EventsPage(),
      'appBarTitle': 'Events',
    },
    {
      'page': WorkshopsPage(),
      'appBarTitle': 'Workshops',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Future<dynamic> _launchUrl(String url) async {
    setState(() {
      launchUrl = url;
    });
    if (await canLaunch(launchUrl)) {
      await launch(launchUrl);
    } else {
      throw 'Could not launch $launchUrl';
    }
  }

  _launchgmail() async {
    const url =
        'mailto:harshitsingh15967@gmail.com?subject=Feedback&body=Feedback for Our Support';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> sharer() async {
    await FlutterShare.share(
        title: 'ACM Apps share',
        text: 'Download ACM Student Android application',
        linkUrl: 'https://play.google.com/store',
        chooserTitle: 'ACM PEC Chooser Title');
  }

  Future<bool> _onWillPop() {
    Alert(
      style: AlertStyle(
        backgroundColor: LightTheme,
        titleStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
        descStyle: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
      ),
      context: context,
      type: AlertType.error,
      title: "Exit",
      desc: "Do you want to exit the app ?",
      buttons: [
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(
                fontFamily: 'Montserrat', color: Colors.white, fontSize: 20),
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
            style: TextStyle(
                fontFamily: 'Montserrat', color: Colors.white, fontSize: 20),
          ),
          onPressed: () => SystemNavigator.pop(),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
  }
  Future<bool> _onSettingsButtonsPressed(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text(
              'Connect with us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Montserrat',
              ),
            ),
            content: GestureDetector(
              onTap: () => Navigator.pushNamed(context, AboutPage.routeName),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                child: ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text('About Us', style: TextStyle(fontFamily: 'Montserrat'),),
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: LightTheme,
                      child: IconButton(
                        icon: Icon(
                          Feather.facebook,
                          color: Colors.black,
                        ),
                        onPressed: () => _launchUrl(facebookPageURL),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      backgroundColor: LightTheme,
                      child: IconButton(
                        icon: Icon(
                          Feather.twitter,
                          color: Colors.black,
                        ),
                        onPressed: () => _launchUrl(twitterPageUrl),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      backgroundColor: LightTheme,
                      child: IconButton(
                        icon: Icon(
                          Feather.instagram,
                          color: Colors.black,
                        ),
                        onPressed: () => _launchUrl(instagramPageURL),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      backgroundColor: LightTheme,
                      child: IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                        onPressed: sharer,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    CircleAvatar(
                      backgroundColor: LightTheme,
                      child: IconButton(
                        icon: Icon(
                          Icons.feedback,
                          color: Colors.black,
                        ),
                        onPressed: () => _launchgmail(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(_pages[_selectedPageIndex]['appBarTitle'],
              style: TextStyle(fontFamily: 'Montserrat')),
          actions: <Widget>[
            IconButton(
              icon: Icon(Feather.settings),
              onPressed: () => _onSettingsButtonsPressed(context),
              tooltip: "Log Out",
            ),
          ],
        ),
        drawer: HomePageDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: LightTheme,
          onTap: _selectPage,
          unselectedItemColor: LightTheme,
          selectedItemColor: greenColor,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.near_me),
                title: Text('Feed', style: TextStyle(fontFamily: 'Montserrat'))),
            BottomNavigationBarItem(
                icon: Icon(Icons.event),
                title: Text(
                  'Events',
                  style: TextStyle(fontFamily: 'Montserrat'),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.work),
                title: Text('Workshops',
                    style: TextStyle(fontFamily: 'Montserrat'))),
          ],
        ),
        body: _pages[_selectedPageIndex]['page'],
      ),
    );
  }
}
