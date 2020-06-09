import 'package:acmcssdeadline/pages/about_page.dart';
import 'package:acmcssdeadline/pages/app_coordinators/app_coordinators_page.dart';
import 'package:acmcssdeadline/pages/events_page.dart';
import 'package:acmcssdeadline/pages/faq/faq_page.dart';
import 'package:acmcssdeadline/pages/login_page.dart';
import 'package:acmcssdeadline/pages/news/news_page.dart';
import 'package:acmcssdeadline/pages/sessions/sessions_page.dart';
import 'package:acmcssdeadline/pages/sponsors_page.dart';
import 'package:acmcssdeadline/pages/team_members/members_page.dart';
import 'package:acmcssdeadline/pages/workshops/workshops_page.dart';
import 'package:acmcssdeadline/splash_screens/SplashScreen.dart';
import 'package:acmcssdeadline/tab_Screens/tabs_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ACM CSS',
      theme: ThemeData.dark(),
      home: AnimatedSplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        TabScreen.routeName: (context) => TabScreen(),
        EventsPage.routeName: (context) => EventsPage(),
        WorkshopsPage.routeName: (context) => WorkshopsPage(),
        SessionsPage.routeName: (context) => SessionsPage(),
        SponsorsPage.routeName: (context) => SponsorsPage(),
        AboutPage.routeName: (context) => AboutPage(),
        TeamMembersPage.routeName: (context) => TeamMembersPage(),
        NewsPage.routeName: (context) => NewsPage(),
        AppCoordinatorsPage.routeName: (context) => AppCoordinatorsPage(),
        ChatScreen.routeName: (context) => ChatScreen(),
      },
    );
  }
}
