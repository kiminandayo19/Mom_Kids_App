import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mom_and_kids_app/screens/LoginPage/login_screens.dart';
import 'package:mom_and_kids_app/screens/Subscriptions/subscription_screen.dart';
import 'package:mom_and_kids_app/screens/profile/profile.dart';

class Draw extends Drawer {
  List<String> menuName = [
    "Profile",
    "Message",
    "Subscription",
    "Sign Out",
  ];
  List<String> menuIcons = [
    "profile",
    "message",
    "subscription",
    "signout",
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            20,
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF0F5F5),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 60,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                "assets/icons/arrow.svg",
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CircleAvatar(
              backgroundColor: const Color(0xFF8EC3B3),
              radius: 40,
              child: Image.asset(
                "assets/images/doctor.png",
                scale: 1.5,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Risma Hanida",
              style: TextStyle(
                fontFamily: "Avenir-Black",
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const Divider(
              indent: 4,
              color: Color(0xFF62A19B),
              thickness: 1.2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.separated(
                itemCount: menuName.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/${menuIcons[index]}.svg",
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (index == 2) {
                            Navigator.pushNamed(
                              context,
                              Subscription.routesName,
                            );
                          } else if (index == 0) {
                            Navigator.pushReplacementNamed(
                              context,
                              ProfileDetail.routesName,
                            );
                          } else if (index == 3) {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginScreens.routesName,
                            );
                          } else {
                            return;
                          }
                        },
                        child: Text(
                          menuName[index],
                          style: const TextStyle(
                            fontFamily: "Avenir-Roman",
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
