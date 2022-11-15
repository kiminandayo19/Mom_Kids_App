import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mom_and_kids_app/routes.dart';
import 'package:mom_and_kids_app/screens/Subscriptions/payments.dart';
import 'package:mom_and_kids_app/screens/home/main_home.dart';
import 'package:mom_and_kids_app/screens/splash.dart';
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
  runApp(const MomAndKids());
}

class MomAndKids extends StatelessWidget {
  const MomAndKids({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mom and Kids",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFCFCFC),
      ),
      // initialRoute: Screens.routesName,
      initialRoute: Splash.routesName,
      // home: LoginScreens(),
      routes: routes,
    );
  }
}
