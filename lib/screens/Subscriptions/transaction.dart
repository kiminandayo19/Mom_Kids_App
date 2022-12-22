import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/Widgets/AppBars/navAppBar.dart';
import 'package:mom_and_kids_app/arguments/payments-arg.dart';

class Transaction extends StatefulWidget {
  static String routesName = "/transaction";
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  List<String> total = ["120", "2.00", "122"];
  List<String> totalName = ["Subtotal", "Tax", "Total"];

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as PaymentArguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavAppBar(
        useLeading: true,
        useActions: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Confirm Payment",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                fontFamily: "Avenir-Black",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: WaveClip1(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                          color: const Color(0xFF006167).withOpacity(1),
                        ),
                      ),
                    ),
                  ),
                  ClipPath(
                    clipper: WaveClip2(),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                          ),
                          color: const Color(0xFF62A19B).withOpacity(1),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF73AEA4),
                            Color.fromARGB(178, 154, 174, 164)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 20,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "1 Month",
                                style: TextStyle(
                                  fontFamily: "Avenir-Roman",
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$${arg.price.toString()}",
                                style: const TextStyle(
                                  fontFamily: "Avenir-Roman",
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Price \$${arg.price.toString()}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Avenir-Roman",
                                  fontSize: 16,
                                ),
                              ),
                              const Text(
                                "Monthly",
                                style: TextStyle(
                                  fontFamily: "Avenir-Roman",
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: ListView.separated(
                  itemCount: total.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            totalName[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Avenir-Roman",
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "\$${total[index]}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: "Avenir-Roman",
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, int index) => const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF62A19B),
                  fixedSize: const Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  // Navigator.pushNamed(
                  //   context,
                  //   Transaction.routesName,
                  //   arguments: PaymentArguments(
                  //     price: arg.price,
                  //     val: val,
                  //   ),
                  // );
                },
                child: const Text(
                  "Confirm Payment",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClip1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..moveTo(size.width / 5, 0)
      ..lineTo(size.width / 5, size.height - 40)
      ..cubicTo(
        size.width + 50,
        size.height + 20,
        size.width * 0.5,
        size.height * 0.2,
        size.width,
        0,
      )
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class WaveClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 50)
      ..quadraticBezierTo(
        size.width / 3.4,
        size.height + 70,
        size.width / 3,
        size.height - 90,
      )
      ..quadraticBezierTo(
        size.width - (size.width * 0.63),
        size.height - 170,
        size.width - (size.width / 3),
        size.height - 50,
      )
      ..quadraticBezierTo(
        size.width - (size.width / 6),
        size.height + 20,
        size.width,
        0,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
