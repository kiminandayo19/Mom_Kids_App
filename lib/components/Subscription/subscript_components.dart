import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/arguments/payments-arg.dart';
import 'package:mom_and_kids_app/screens/Subscriptions/payments.dart';

class Script extends ListView {
  int index;
  List<int> prices = [10, 25, 30];
  List<String> features = [
    "Access on all devices",
    "Free consultation",
    "24/7 consultation support",
    "Unlock premium content",
  ];

  Script({
    required this.index,
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
                    text: "\$${prices[index - 2].toString()}",
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
                text: const TextSpan(
                  text: "In addition to all features in ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Avenir-Roman",
                  ),
                  children: <InlineSpan>[
                    TextSpan(
                      text: "classic, premium",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Avenir-Roman",
                      ),
                    ),
                    TextSpan(
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ListView.separated(
                        itemCount: index,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
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
                                features[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 31,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF62A19B),
                  minimumSize: const Size(200, 40),
                  maximumSize: const Size(400, 100),
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Payments.routesName,
                    arguments: PaymentArguments(
                      price: prices[index - 2],
                    ),
                  );
                },
                child: const Text(
                  "Subscribe",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
