import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mom_and_kids_app/Widgets/Button/button.dart';
import 'package:mom_and_kids_app/screens/devices/device.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> activities = [
    "Pregnancy exercise",
    "Drink more water",
    "Eat more protein"
  ];

  List<int> quantity = [30, 2, 40];

  List<String> icon = ["exercise", "water", "exercise"];

  List<String> frequency = ["mins/day", "lt/days", "gr/day"];

  List<String> judul = [
    "High Temperature",
    "Normal Blood Pressure",
    "Low Heart Rate",
    "Normal Oxygen Level",
  ];

  List<String> textt = [
    "Kenaikan suhu pada trisemester awal kehamilan adalah hal yang wajar karena tubuh beradaptasi, apabila perubahan suhu terlalu tinggi maka salah satu faktornya dipicu oleh respon tubuh melawan bakteri atau virus.",
    "Pada trimester dua kehamilan, tekanan darah rendah karena pembuluh darah melebar untuk jalannya darah ke rahim. Faktor lain juga dapar memengaruhi seperti anemia, dehidrasi, malnutrisi, penyait jantung, dsb",
    "Denyut nadi tinggi dapat terjadi ketika melakukan aktivitas fisik atau setelah berolahraga, persaan cemas, memiliki riwayat penyakit jantung dan mengkonsumsi kafein",
    "Lorem Ipsum",
  ];

  @override
  Widget build(BuildContext context) {
    // Default device is "Lilygo Wristband"
    final deviceName =
        ModalRoute.of(context)?.settings.arguments ?? "Lilygo Wristband";
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Monitoring",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Avenir-Black",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Card(
              elevation: 1.5,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "Connected Devices: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Device.routesName);
                            },
                            child: Text(
                              "$deviceName >",
                              style: const TextStyle(
                                color: Color(0xFFFF725E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    "Temperature",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _modalShow(context, "35.7\u00b0c", 1,
                                        judul[0], textt[0]);
                                  },
                                  child: const Text(
                                    "35.7\u00b0c",
                                    style: TextStyle(
                                      color: Color(0xFFDE1B50),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 5,
                                  ),
                                  child: Text(
                                    "Heart Rate",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _modalShow(context, "78.5 bts/min", 0,
                                        judul[1], textt[1]);
                                  },
                                  child: const Text(
                                    "78.5 bts/min",
                                    style: TextStyle(
                                      color: Color(0XFFD95A3F),
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                  bottom: 5,
                                ),
                                child: Text(
                                  "Blood Pressure",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _modalShow(context, "120/80 mmHg", 1,
                                      judul[2], textt[2]);
                                },
                                child: const Text(
                                  "120/80 mmHg",
                                  style: TextStyle(
                                    color: Color(0xFF37A2A5),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Oxygen Level",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _modalShow(
                                    context,
                                    "95%",
                                    0,
                                    judul[3],
                                    textt[3],
                                  );
                                },
                                child: const Text(
                                  "95%",
                                  style: TextStyle(
                                    color: Color(0xFF37A2A5),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Last Updated: 7 min ago",
                      style: TextStyle(
                        color: Color(0xFF808080),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Baby's Detail",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Avenir-Black",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Card(
              elevation: 1.5,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset("assets/images/bunderan.png"),
                        Positioned(
                          right: MediaQuery.of(context).size.width * 0.675,
                          child: Image.asset("assets/images/bayicilik.png"),
                        ),
                        Center(
                          child: Image.asset("assets/images/bayigede.png"),
                        ),
                        Positioned(
                          left: MediaQuery.of(context).size.width * 0.65,
                          child: Image.asset("assets/images/bayisedeng.png"),
                        ),
                      ],
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
                          avatar:
                              SvgPicture.asset("assets/icons/weight_icon.svg"),
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
                          backgroundColor:
                              const Color(0xFF79B3A8).withOpacity(0.15),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Chip(
                          avatar:
                              SvgPicture.asset("assets/icons/length_icon.svg"),
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
                          backgroundColor:
                              const Color(0xFF79B3A8).withOpacity(0.15),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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

  _modalShow(context, text, index, title, sentences) {
    List<Color> warna;
    {
      index == 1
          ? warna = [
              Color(0xFFD95A3F),
              Color(0xFFFF725E),
            ]
          : warna = [
              Color(0xFF000000),
              Color(0xFF37A2A5),
            ];
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 350,
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: warna[0],
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    text.toString(),
                    style: TextStyle(
                      color: warna[1],
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Text(
                    sentences,
                    textAlign: TextAlign.center,
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(
                  //     vertical: 30,
                  //   ),
                  //   child: Center(
                  //     child: Button(
                  //       width: 40,
                  //       height: 20,
                  //       radius: 100,
                  //       text: "Refresh",
                  //       fontSize: 16,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
