import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/screens/LoginPage/login_screens.dart';
<<<<<<< HEAD
import 'package:mom_and_kids_app/screens/Subscriptions/transaction.dart';
import 'package:mom_and_kids_app/screens/home/main_home.dart';
=======
// import 'package:mom_and_kids_app/screens/home/main_home.dart';
>>>>>>> bc599ad3a69822dead13d9eb9d226580deb952ea
import 'package:mom_and_kids_app/screens/register/register_screen.dart';
import 'screens/GetStarted/get_started_detail_screen.dart';
import 'screens/GetStarted/get_started_screen.dart';
import 'screens/Questions/pregnant_q_screen.dart';
import 'screens/Questions/studdler_q_screen.dart';
import 'screens/Subscriptions/payments.dart';
import 'screens/Subscriptions/subscription_screen.dart';
import 'screens/home/studdler_home_screen.dart';
import 'screens/splash.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routesName: (context) => const Splash(),
  GetStarted.routesName: (context) => const GetStarted(),
  LoginScreens.routesName: (context) => const LoginScreens(),
  GetStartedDetail.routesName: (context) => const GetStartedDetail(),
  PreqQScreen.routesName: (context) => const PreqQScreen(),
  StuddlerQScreen.routesName: (context) => const StuddlerQScreen(),
  StuddlerHome.routesName: (context) => const StuddlerHome(),
  Subscription.routesName: (context) => const Subscription(),
  Payments.routesName: (context) => Payments(),
  RegisterScreens.routesName: (context) => const RegisterScreens(),
<<<<<<< HEAD
  Screens.routesName: (context) => const Screens(),
  Transaction.routesName: (context) => Transaction(),
=======
  // Screens.routesName: (context) => Screens(),
>>>>>>> bc599ad3a69822dead13d9eb9d226580deb952ea
};
