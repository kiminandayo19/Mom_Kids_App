import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mom_and_kids_app/screens/LoginPage/login_screens.dart';
import 'package:mom_and_kids_app/Widgets/AppBars/navAppBar.dart';

class ProfileDetail extends StatelessWidget {
  static const String routesName = '/profile';
  final String idUser = '190945678';
  ProfileDetail({super.key});

  List<String> profileCaptions = [
    "My Membership",
    "Contact Us",
    "Privacy Policy"
  ];

  List<String> profileIcons = ["reward", "phone", "shield"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavAppBar(
        useLeading: true,
        useActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Avenir-Black",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundColor: Color(0xFFD95A3F),
                    child: CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                  ),
                  Positioned(
                    width: 80,
                    left: 40,
                    top: MediaQuery.of(context).size.height * 0.148,
                    child: GestureDetector(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: const Color(0xFF263238),
                          child: ClipOval(
                            child: Image.asset("assets/icons/camera.png"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const Text(
              "Suci Hendrawati",
              style: TextStyle(
                fontFamily: "Avenir-Roman",
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              "ID : $idUser",
              style: const TextStyle(
                fontFamily: "Avenir-Roman",
                fontSize: 14,
                color: Color(0xFF808080),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.17,
              child: ListView.separated(
                itemCount: profileCaptions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/${profileIcons[index]}.png",
                          scale: 1.2,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          profileCaptions[index],
                          style: const TextStyle(
                            fontSize: 17,
                            fontFamily: "Avenir-Black",
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF37A2A5),
                fixedSize: const Size(120, 50),
                elevation: 0,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, LoginScreens.routesName);
              },
              child: const Text(
                "Log Out",
                style: TextStyle(
                  fontFamily: "Avenir-Black",
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
