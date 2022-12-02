import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<String> activities = [
    "Pregnancy exercise",
    "Drink more water",
    "Eat more protein"
  ];
  List<int> quantity = [30, 2, 40];
  List<String> icon = ["exercise", "water", "exercise"];
  List<String> frequency = ["mins/day", "lt/days", "gr/day"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          const Text(
            "First trismester of pregnancy",
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
              "Babies in the womb experience the formation and refinement of organs",
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
                      text: '9.5',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Avenir-Regular",
                        fontSize: 14.0,
                      ),
                    ),
                    TextSpan(
                      text: ' gr',
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
                              "${quantity[index]} ${frequency[index]}",
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
