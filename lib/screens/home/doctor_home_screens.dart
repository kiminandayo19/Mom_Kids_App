import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorHome extends StatelessWidget {
  DoctorHome({Key? key}) : super(key: key);

  List<String> activities = [
    "Standby for Incoming Chat",
    "Prescribe Medicine",
    "Expressing Breast Milk",
  ];
  List<String> quantity = [
    "09.00 - 17.00",
    "",
    "",
  ];
  List<String> icon = [
    "exercise",
    "water",
    "exercise",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          Stack(
            // alignment: const Alignment(0, 15),
            children: <Widget>[
              Container(
                height: 233,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 120.0),
                    ),
                    gradient: const LinearGradient(
                      colors: [Color(0xff4d918f), Color(0xff8ec3b3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )),
              ),
              Column(children: <Widget>[
                const SizedBox(
                  height: 55,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.77,
                      child: const Center(
                        child: Text(
                          "Hi, Suci Hendrawati.",
                          style: TextStyle(
                              fontFamily: "Avenir-Black",
                              fontSize: 16.0,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 96.0),
                    child: Container(
                      height: 219,
                      width: 219,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: SvgPicture.asset(
                        "assets/icons/doc.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 162.0),
                    alignment: const Alignment(-1.1, 0),
                    child: Container(
                      height: 58,
                      width: 58,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9.24),
                        child: SvgPicture.asset(
                          "assets/icons/doc.svg",
                          width: 1, height: 1,
                          // fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 162.0),
                    alignment: const Alignment(1.1, 0),
                    child: Container(
                      height: 58,
                      width: 58,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1000),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 4),
                            )
                          ]),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 9.24),
                        child: SvgPicture.asset(
                          "assets/icons/doc.svg",
                          width: 1, height: 1,
                          // fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Welcome, Dr. Risma",
            style: TextStyle(
                fontFamily: "Avenir-Black",
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            width: 270,
            child: Text(
              "Lets check some task to do and standby for incoming chat consultation",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Avenir-Regular",
                fontSize: 12.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Chip(
                avatar: SvgPicture.asset("assets/icons/weight_icon.svg"),
                label: RichText(
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '32',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Avenir-Regular",
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' yr',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Avenir-Regular",
                        fontSize: 10.0,
                      ),
                    ),
                  ]),
                ),
                backgroundColor: const Color(0xFF79B3A8).withOpacity(0.15),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Chip(
                avatar: SvgPicture.asset("assets/icons/length_icon.svg"),
                label: RichText(
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: '30.2',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Avenir-Regular",
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' cm',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Avenir-Regular",
                        fontSize: 10.0,
                      ),
                    ),
                  ]),
                ),
                backgroundColor: const Color(0xFF79B3A8).withOpacity(0.15),
              ),
            ],
          ),
          const SizedBox(
            height: 29,
          ),
          Row(children: const <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Task to Do",
                style: TextStyle(
                    fontFamily: "Avenir-Black",
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.builder(
                padding: const EdgeInsets.only(top: 12.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80.0,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.only(bottom: 6),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF336A63).withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 12,
                            offset: const Offset(
                                0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Card(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 0.0, top: 4.0),
                          leading: SvgPicture.asset(
                            "assets/icons/${icon[index]}_icon.svg",
                            fit: BoxFit.fitWidth,
                          ),
                          title: Transform.translate(
                            offset: const Offset(-17.0, -3.0),
                            child: Text(
                              activities[index].toString(),
                              style: const TextStyle(
                                fontFamily: "Avenir-Regular",
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          subtitle: Transform.translate(
                            offset: const Offset(-17.0, -5),
                            child: Text(
                              quantity[index],
                              style: TextStyle(
                                  fontFamily: "Avenir-Regular",
                                  fontSize: 12.0,
                                  color: (icon[index].toString() == "exercise")
                                      ? const Color(0xFFF5907B)
                                      : const Color(0xFF7BC9F5)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
