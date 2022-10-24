import 'package:mom_and_kids_app/screens/article/article_screen.dart';
import 'package:mom_and_kids_app/screens/community/forum_screen.dart';
import 'package:mom_and_kids_app/screens/consultation/consultation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'screens/home/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "mom and kids",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFFCFCFC),
        ),
        home: Screens()
    );
  }
}

class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Home(),
    Article(),
    Consultation(),
    Forum()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/nav_home_icon.svg"),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              "assets/icons/nav_home_icon.svg",
              color: const Color(0xFF8EC3B3),
            ),
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/nav_article_icon.svg"),
            label: 'Article',
            activeIcon: SvgPicture.asset(
              "assets/icons/nav_article_icon.svg",
              color: const Color(0xFF8EC3B3),
            ),
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/nav_consultation_icon.svg"),
            label: 'Consultation',
            activeIcon: SvgPicture.asset(
              "assets/icons/nav_consultation_icon.svg",
              color: const Color(0xFF8EC3B3),
            ),
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/nav_community_icon.svg"),
            label: 'Community',
            activeIcon: SvgPicture.asset(
              "assets/icons/nav_community_icon.svg",
              color: const Color(0xFF8EC3B3),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF8EC3B3),
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontFamily: "Avenir-Regular", fontSize: 10.0),
        unselectedLabelStyle: const TextStyle(fontFamily: "Avenir-Regular", fontSize: 10.0),
      ),
    );
  }
}

