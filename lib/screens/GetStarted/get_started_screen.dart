import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mom_and_kids_app/Widgets/CombineHyperLinkText/combineHyperLinkText.dart.dart';
import 'package:mom_and_kids_app/screens/LoginPage/login_screens.dart';
import 'package:mom_and_kids_app/screens/register/register_screen.dart';
import '../../Widgets/Button/button.dart';
import '../../utils/constant.dart';

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
                Text(
                  "Welcome to Mom & Kids,",
                  textAlign: TextAlign.center,
                  style: nunitoNormal(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "the most complete parenting app",
                  textAlign: TextAlign.center,
                  style: nunitoNormal(
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
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreens.routesName);
                    },
                    label: "Get Started",
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: CombineHyperlinkText(
                      unclickableText: "Already have an account?",
                      clickableText: "Log in",
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreens.routesName);
                      },
                    ),
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
