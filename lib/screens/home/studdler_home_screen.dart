import 'package:flutter/material.dart';

class StuddlerHome extends StatefulWidget {
  static String routesName = "/stud-home";
  const StuddlerHome({super.key});

  @override
  State<StuddlerHome> createState() => _StuddlerHomeState();
}

class _StuddlerHomeState extends State<StuddlerHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0XFFF4F7F8),
      body: StudHome(),
    );
  }
}

class StudHome extends StatefulWidget {
  const StudHome({super.key});

  @override
  State<StudHome> createState() => _StudHomeState();
}

class _StudHomeState extends State<StudHome> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              ClipPath(
                clipper: HomeClip(),
                child: Container(
                  width: width,
                  height: height * 0.3,
                  decoration: BoxDecoration(
                    gradient: linGrad(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hi, Suci Hendrawati.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "Avenir-Black",
                            ),
                          ),
                          Image.asset("assets/Icons/person.png"),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 35,
                      ),
                      child: Text(
                        "1st month old babies love the sound of your voice, but they will get startled if they hear a loud noise",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontFamily: "Avenir-Roman",
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      height: height * 0.1,
                      width: width * 0.83,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(20, 0, 0, 0),
                            spreadRadius: 3,
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 93,
                            height: 64.74,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(),
                              child: Image.asset(
                                "assets/Icons/bocil.png",
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 5,
                            ),
                            child: SizedBox(
                              width: 178,
                              height: 60,
                              child: DecoratedBox(
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 56,
                                      height: 60,
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 28,
                                              height: 28,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color:
                                                      const Color(0XFF62A19B),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                      "assets/Icons/calendar.png"),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: const SizedBox(
                                                  width: 56,
                                                  height: 32,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      "1 month",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            "Avenir-Roman",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 56,
                                      height: 60,
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 28,
                                              height: 28,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color:
                                                      const Color(0XFF62A19B),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                      "assets/Icons/ruler.png"),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: const SizedBox(
                                                  width: 56,
                                                  height: 32,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      "48.5 cm",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            "Avenir-Roman",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 56,
                                      height: 60,
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 28,
                                              height: 28,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color:
                                                      const Color(0XFF62A19B),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                      "assets/Icons/weight.png"),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 8),
                                                child: const SizedBox(
                                                  width: 56,
                                                  height: 32,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(),
                                                    child: Text(
                                                      "3.7 kg",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 13,
                                                        fontFamily:
                                                            "Avenir-Roman",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(
              top: 59,
              left: 35,
              right: 35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Task to Do",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Avenir-Black",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CardListTile(
                    title: "Baby's Day Out",
                    subtitle: "1 hours/day",
                    color: const Color(0XFFF0A967),
                    image: "workout.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CardListTile(
                    title: "Music Therapy For Baby",
                    subtitle: "30 minute/days",
                    color: const Color(0XFF54AEE0),
                    image: "waterdrop.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CardListTile(
                    title: "Expressing Breast Milk",
                    subtitle: "2-4 times/days",
                    color: const Color(0XFFCB624C),
                    image: "meat.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CardListTile(
                    title: "Get In A Routine",
                    subtitle:
                        "Start a new habit of doing some of the same things each day at the same time.",
                    color: const Color(0XFF688B9E),
                    image: "sleep.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CardListTile(
                    title: "Eat More Protein",
                    subtitle: "1 hours/day",
                    color: const Color(0XFFF5907B),
                    image: "workout.png",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CardListTile(
                    title: "Eat More Protein",
                    subtitle: "1 hours/day",
                    color: const Color(0XFFF5907B),
                    image: "workout.png",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient linGrad() {
    return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          Color(0XFF4D918F),
          Color(0XFF8EC3B3),
        ]);
  }
}

// ignore: must_be_immutable
class CardListTile extends StatelessWidget {
  String title, subtitle;
  String image;
  Color color;

  CardListTile({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(
        vertical: 4,
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: color,
        child: Image.asset("assets/Icons/$image"),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: "Avenir-Roman",
        ),
      ),
      subtitle: Text(
        subtitle,
        maxLines: 2,
        style: TextStyle(
          fontSize: 14,
          color: color,
          fontFamily: "Avenir-Roman",
        ),
      ),
    );
  }
}

class HomeClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.75,
    );
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class BabyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * 0.3, 0);
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width * 0.7, 0);
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.2,
      size.width * 0.3,
      0,
    );
    path.moveTo(size.width * 0.3, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
