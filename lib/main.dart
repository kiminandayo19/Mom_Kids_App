import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mom_and_kids_app/Services/Routes/routes.dart';
import 'package:mom_and_kids_app/screens/splash.dart';

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
        applyElevationOverlayColor: true,
      ),
      // initialRoute: Screens.routesName,
      initialRoute: Splash.routesName,
      // home: LoginScreens(),
      routes: routes,
    );
  }
}
