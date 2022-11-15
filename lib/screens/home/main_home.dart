import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/drawer/drawer.dart';
import '../article/article_screen.dart';
import '../community/forum_screen.dart';
import '../consultation/consultation_screen.dart';
import 'doctor_home_screens.dart';
import 'home_screen.dart';

class Screens extends StatefulWidget {
  final VoidCallback signOut;
  Screens(this.signOut, {super.key});
  static String routesName = "/home";
  // const Screens({Key? key}) : super(key: key);

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int _selectedIndex = 0;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  static final List<Widget> _widgetOptions = <Widget>[
<<<<<<< HEAD
    DoctorHome(),
    Article(),
    Consultation(),
    Forum()
=======
    Home(),
    const Article(),
    const Consultation(),
    const Forum()
>>>>>>> bc599ad3a69822dead13d9eb9d226580deb952ea
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  signOut(){
    setState(() {
      widget.signOut();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      key: scaffoldKey,
=======
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){
              signOut();
            },
            icon: const Icon(Icons.logout_rounded),
          )
        ]
      ),
>>>>>>> bc599ad3a69822dead13d9eb9d226580deb952ea
      extendBodyBehindAppBar: true,
      body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      drawer: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.04,
        ),
        child: Draw(),
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
        selectedLabelStyle:
            const TextStyle(fontFamily: "Avenir-Regular", fontSize: 10.0),
        unselectedLabelStyle:
            const TextStyle(fontFamily: "Avenir-Regular", fontSize: 10.0),
      ),
    );
  }
}
