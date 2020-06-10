import 'dart:math';

import 'package:acmcssdeadline/pages/sessions/sessions_page.dart';
import 'package:acmcssdeadline/pages/sponsors_page.dart';
import 'package:acmcssdeadline/pages/team_members/members_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:acmcssdeadline/constants.dart';
import 'package:acmcssdeadline/pages/about_page.dart';
import 'package:acmcssdeadline/pages/app_coordinators/app_coordinators_page.dart';
import 'package:acmcssdeadline/pages/my_profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageDrawer extends StatefulWidget {
  @override
  _HomePageDrawerState createState() => _HomePageDrawerState();
}

class _HomePageDrawerState extends State<HomePageDrawer>
    with SingleTickerProviderStateMixin {
  String launchUrl = "";
  SharedPreferences sharedPreferences;
  String studentName = "";
  String emailId = "";

  final GlobalKey _menuIconkey = GlobalKey();

  final Color _menuBg = Colors.black54;

  Animation<double> _menuAnimation;

  Animation<double> _toolbarTitleFadeAnimation;

  AnimationController _guillotineMenuAnimationController;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _getInfo() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      studentName = sharedPreferences.getString("studentName") ?? "name";
    });
    final FirebaseUser currentUser = await _auth.currentUser();
    setState(() {
      emailId = currentUser.email;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getInfo();
    _guillotineMenuAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    )..addListener(() {
        setState(() {});
      });

    // Menu Animation

    _menuAnimation = Tween(begin: -pi / 2, end: 0.0).animate(CurvedAnimation(
        parent: _guillotineMenuAnimationController,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn));

    // Toolbar Title Transition

    _toolbarTitleFadeAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_guillotineMenuAnimationController);
  }

  Widget _buildDrawerListTile(
      {String title, IconData icon, Function function}) {
    return Expanded(
      child: ListTile(
        onTap: function,
        title: Text(
          title,
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
        leading: Icon(icon),
      ),
    );
  }

  Widget _buildURLLogos({String imagePath, String pageURL}) {
    return GestureDetector(
      onTap: () => _launchUrl(pageURL),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 25.0,
        ),
        child: Image.asset(
          imagePath,
          width: 35.0,
          height: 35.0,
        ),
      ),
    );
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

  _getPosition(_) {
    _getOffset();
  }

  void _getOffset() {
    final RenderBox offsetBox = _menuIconkey.currentContext.findRenderObject();
    final Offset offset = offsetBox.localToGlobal(Offset.zero);
    print("Offset : $offset");
  }

  @override
  void dispose() {
    super.dispose();
    _guillotineMenuAnimationController.dispose();
  }

  void _onMenuIconClick() {
    if (_isMenuVisible()) {
      _guillotineMenuAnimationController.reverse();
    } else {
      _guillotineMenuAnimationController.forward();
    }
  }

  bool _isMenuVisible() {
    final AnimationStatus status = _guillotineMenuAnimationController.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

//  @override
//  Widget build(BuildContext context) {
//    return Drawer(
//      child: Column(
//        children: <Widget>[
//          UserAccountsDrawerHeader(
//            currentAccountPicture: CircleAvatar(
//              backgroundColor: greenColor,
//              child: Icon(
//                Icons.person,
//                size: 30.0,
//                color: Colors.white,
//              ),
//            ),
//            accountEmail: Text(emailId),
//            accountName: Text(studentName),
//          ),
//          _buildDrawerListTile(
//            title: 'My Profile',
//            icon: Icons.person_outline,
//            function: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => MyProfilePage())),
//          ),
//          /*        Divider(),
//          _buildDrawerListTile(
//            title: 'Past Events',
//            icon: Icons.event,
////            function: () => Navigator.push(
////                context, MaterialPageRoute(builder: (context) => PastEvents())),
//          ),*/
//          Divider(),
//          _buildDrawerListTile(
//            title: 'Sessions',
//            icon: Icons.school,
//            function: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => SessionsPage())),
//          ),
//          Divider(),
//          _buildDrawerListTile(
//            title: 'Team',
//            icon: Icons.group_work,
//            function: () =>
//                Navigator.pushNamed(context, TeamMembersPage.routeName),
//          ),
//          Divider(),
//          _buildDrawerListTile(
//            title: 'App Coordinator',
//            icon: Icons.code,
//            function: () => Navigator.push(context,
//                MaterialPageRoute(builder: (context) => AppCoordinatorsPage())),
//          ),
//          Divider(),
//          _buildDrawerListTile(
//            title: 'Sponsors',
//            icon: Icons.info_outline,
//            function: () =>
//                Navigator.pushNamed(context, SponsorsPage.routeName),
//          ),
//          Divider(),
//          _buildDrawerListTile(
//            title: 'About',
//            icon: Icons.info_outline,
//            function: () => Navigator.pushNamed(context, AboutPage.routeName),
//          ),
//          Divider(),
//          SizedBox(
//            height: 40.0,
//          ),
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    _buildURLLogos(
//                      imagePath: facebookLogoPath,
//                      pageURL: facebookPageURL,
//                    ),
//                    _buildURLLogos(
//                      pageURL: instagramPageURL,
//                      imagePath: instagramLogoPath,
//                    ),
//                    _buildURLLogos(
//                      imagePath: twitterLogoPath,
//                      pageURL: twitterPageUrl,
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _menuAnimation.value,
      origin: Offset(32.0, 50.0),
      alignment: Alignment.topLeft,
      child: Material(
        color: _menuBg,
        child: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _toolbar(),
                ),
                Expanded(
                  flex: 8,
                  child: _menuItems(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _toolbar() {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
        // padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: <Widget>[_toolbarIcon(), _toolbarTitle()],
        ),
      ),
    );
  }

  Widget _toolbarIcon() {
    return IconButton(
      key: _menuIconkey,
      icon: Icon(
        Icons.menu,
        color: Colors.white,
      ),
      onPressed: () => _onMenuIconClick(),
    );
  }

  Widget _toolbarTitle() {
    return FadeTransition(
      opacity: _toolbarTitleFadeAnimation,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Text(
          "Activity",
          style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontSize: 24,
              letterSpacing: 2.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _menuItems() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.white),
            title: Text(
              'My Profile',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfilePage(),
                ),
              );

              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.white),
            title: Text(
              'Sessions',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SessionsPage(),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.chat, color: Colors.white),
            title: Text(
              'Team',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeamMembersPage(),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text(
              'App Coordinators',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppCoordinatorsPage(),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text(
              'Sponsors',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SponsorsPage(),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text(
              'About Us',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
