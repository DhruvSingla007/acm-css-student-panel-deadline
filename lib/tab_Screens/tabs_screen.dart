import 'package:acmcssdeadline/Widgets/drawer.dart';
import 'package:acmcssdeadline/constants.dart';
import 'package:acmcssdeadline/pages/events_page.dart';
import 'package:acmcssdeadline/pages/news/news_page.dart';
import 'package:acmcssdeadline/pages/workshops/workshops_page.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  static const String routeName = "/tab-screen";

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pages[_selectedPageIndex]['appBarTitle']),
      ),
      drawer: HomePageDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: greenColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.near_me), title: Text('Feed')),
          BottomNavigationBarItem(
              icon: Icon(Icons.event), title: Text('Events')),
          BottomNavigationBarItem(
              icon: Icon(Icons.work), title: Text('Workshops')),
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
