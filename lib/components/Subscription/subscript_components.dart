import 'package:flutter/material.dart';
import '../../Screens/Subscriptions/payments.dart';
import '../../Widgets/button.dart';

class Script extends ListView {
  final String price, type1, type2, features1, features2, features3, features4;

  Script({
    required this.price,
    required this.type1,
    required this.type2,
    required this.features1,
    required this.features2,
    required this.features3,
    required this.features4,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          child: Center(
            child: Card(
              color: const Color(0XFFF4F7F8),
              elevation: 0.8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    text: "\$$price",
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.black,
                      fontFamily: "Avenir-Roman",
                    ),
                    children: const <InlineSpan>[
                      TextSpan(
                        text: "/month",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "Avenir-Roman"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 27,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "In addition to all features in ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Avenir-Roman",
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: "$type1, $type2",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir-Roman",
                      ),
                    ),
                    const TextSpan(
                      text: " also includes:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Avenir-Roman",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle_outline_outlined,
                          color: Color(0XFF8EC3B3),
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          features1,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle_outline_outlined,
                          color: Color(0XFF8EC3B3),
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          features2,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle_outline_outlined,
                          color: Color(0XFF8EC3B3),
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          features3,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle_outline_outlined,
                          color: Color(0XFF8EC3B3),
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          features4,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              Button(
                width: 60,
                height: 80,
                radius: 100,
                text: "Subscribe",
                fontSize: 20,
                routeTo: Payments.routesName,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
