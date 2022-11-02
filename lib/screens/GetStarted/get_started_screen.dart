import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Widgets/AppBars/gs-1.dart';
import '../../Widgets/button.dart';
import '../../Widgets/to_login.dart';
import 'get_started_detail_screen.dart';

class GetStarted extends StatelessWidget {
  static String routesName = "/get-started";

  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Column(
              children: <Widget>[
                SvgPicture.asset("assets/images/logo.svg"),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome to Mom & Kids,",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Avenir-Roman",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Text(
                  "the most complete parenting app",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Avenir-Roman",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  Button(
                    routeTo: GetStartedDetail.routesName,
                    height: 337,
                    width: 54,
                    radius: 100,
                    text: "Get Started",
                    fontSize: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const ToLoginText(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
