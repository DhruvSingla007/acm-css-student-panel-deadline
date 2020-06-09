import 'package:acmcssdeadline/pages/faq/faq_page.dart';
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

class _HomePageDrawerState extends State<HomePageDrawer> {
  String launchUrl = "";
  SharedPreferences sharedPreferences;
  String studentName = "";
  String emailId = "";

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
  }

  Widget _buildDrawerListTile(
      {String title, IconData icon, Function function}) {
    return Expanded(
      child: ListTile(
        onTap: function,
        title: Text(title),
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: greenColor,
              child: Icon(
                Icons.person,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(emailId),
            accountName: Text(studentName),
          ),
          _buildDrawerListTile(
            title: 'My Profile',
            icon: Icons.person_outline,
            function: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyProfilePage())),
          ),
          /*        Divider(),
          _buildDrawerListTile(
            title: 'Past Events',
            icon: Icons.event,
//            function: () => Navigator.push(
//                context, MaterialPageRoute(builder: (context) => PastEvents())),
          ),*/
          Divider(),
          _buildDrawerListTile(
            title: 'Sessions',
            icon: Icons.school,
            function: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SessionsPage())),
          ),
          Divider(),
          _buildDrawerListTile(
            title: 'Team',
            icon: Icons.group_work,
            function: () =>
                Navigator.pushNamed(context, TeamMembersPage.routeName),
          ),
          Divider(),
          _buildDrawerListTile(
            title: 'App Coordinator',
            icon: Icons.code,
            function: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AppCoordinatorsPage())),
          ),
          Divider(),
          _buildDrawerListTile(
            title: 'Sponsors',
            icon: Icons.info_outline,
            function: () =>
                Navigator.pushNamed(context, SponsorsPage.routeName),
          ),
          Divider(),
          _buildDrawerListTile(
            title: 'About',
            icon: Icons.info_outline,
            function: () => Navigator.pushNamed(context, AboutPage.routeName),
          ),
          Divider(),

          _buildDrawerListTile(
            title: "FAQ's",
            icon: Icons.perm_device_information,
            function: () => Navigator.pushNamed(context, ChatScreen.routeName),
          ),
          Divider(),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _buildURLLogos(
                      imagePath: facebookLogoPath,
                      pageURL: facebookPageURL,
                    ),
                    _buildURLLogos(
                      pageURL: instagramPageURL,
                      imagePath: instagramLogoPath,
                    ),
                    _buildURLLogos(
                      imagePath: twitterLogoPath,
                      pageURL: twitterPageUrl,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
