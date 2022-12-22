import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/Widgets/AppBars/navAppBar.dart';
import '../Questions/pregnant_q_screen.dart';
import '../Questions/studdler_q_screen.dart';

class GetStartedDetail extends StatelessWidget {
  static String routesName = "/gs-detail";

  const GetStartedDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: NavAppBar(
        useActions: true,
        useLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Get Started",
              style: TextStyle(
                fontSize: 32,
                color: Color(0XFF000000),
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "Choose you right now",
              style: TextStyle(
                fontSize: 16,
                color: Color(0XFF8E8E8E),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetStartedCard(
              title: "I'am Pregnant",
              caption:
                  "Mothers who are pregnant and looking for a pregnancy guide",
              pic: "assets/icons/mom.png",
              route: PreqQScreen.routesName,
            ),
            const SizedBox(
              height: 20,
            ),
            GetStartedCard(
              title: "I've Given Birth",
              caption:
                  "Mothers who have given birth and are looking for guidance in caring for their children",
              pic: "assets/icons/mom-child.png",
              route: StuddlerQScreen.routesName,
            ),
          ],
        ),
      ),
    );
  }
}

class GetStartedCard extends StatelessWidget {
  final String title;
  final String caption;
  final String pic;
  final dynamic route;

  const GetStartedCard({
    super.key,
    required this.title,
    required this.caption,
    required this.pic,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0XFFF1F5F4),
      elevation: 0.0,
      shadowColor: null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SvgPicture.asset(pic),
                      Image.asset(pic),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        title,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        caption,
                        style: const TextStyle(
                          color: Color(0XFF8E8E8E),
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Color(0XFF8E8E8E),
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
