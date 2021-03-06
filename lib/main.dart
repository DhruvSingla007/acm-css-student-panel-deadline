import 'package:acmcssdeadline/onboarding_pages/onboarding_screen.dart';
import 'package:acmcssdeadline/pages/about_page.dart';
import 'package:acmcssdeadline/pages/app_coordinators/app_coordinators_page.dart';
import 'package:acmcssdeadline/pages/events_page.dart';
import 'package:acmcssdeadline/pages/login_page.dart';
import 'package:acmcssdeadline/pages/my_profile_page.dart';
import 'package:acmcssdeadline/pages/news/news_page.dart';
import 'package:acmcssdeadline/pages/sessions/sessions_page.dart';
import 'package:acmcssdeadline/pages/sponsors_page.dart';
import 'package:acmcssdeadline/pages/team_members/members_page.dart';
import 'package:acmcssdeadline/pages/workshops/workshops_page.dart';
import 'package:acmcssdeadline/splash_screens/SplashScreen.dart';
import 'package:acmcssdeadline/tab_Screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'faq/faq_page.dart';
import 'mentor/become_mentor.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialAppWithTheme();
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'ACM CSS',
      theme: ThemeData.dark(),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        OnboardingScreen.routeName: (context) => OnboardingScreen(),
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
        BecomeMentor.routeName: (context) => BecomeMentor(),
        MyProfilePage.routeName: (context) => MyProfilePage(),
      },
    );
  }
}
