import 'package:flutter/material.dart';
import '../../Widgets/AppBars/gs-3.dart';
import '../../Widgets/button.dart';
import '../LoginPage/login_screens.dart';

class Payments extends StatefulWidget {
  static String routesName = "/payments";
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  Object? val;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GS3(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: ListView(
          children: [
            const Text(
              "Payment Methods",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                fontFamily: "Avenir-Black",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0XFFF4F7F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: const Color(0XFF62A19B),
                ),
                child: RadioListTile(
                  activeColor: const Color(0XFF62A19B),
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                    });
                  },
                  toggleable: true,
                  title: Row(
                    children: [
                      Image.asset("assets/Images/mastercard.png"),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text("Master Card"),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0XFFF4F7F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: const Color(0XFF62A19B),
                ),
                child: RadioListTile(
                  activeColor: const Color(0XFF62A19B),
                  value: 2,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                    });
                  },
                  toggleable: true,
                  title: Row(
                    children: [
                      Image.asset("assets/Images/paypal.png"),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text("Paypal"),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0XFFF4F7F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: const Color(0XFF62A19B),
                ),
                child: RadioListTile(
                  activeColor: const Color(0XFF62A19B),
                  value: 3,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                    });
                  },
                  toggleable: true,
                  title: Row(
                    children: [
                      Image.asset("assets/Images/visa.png"),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text("Visa"),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0XFFF4F7F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: const Color(0XFF62A19B),
                ),
                child: RadioListTile(
                  activeColor: const Color(0XFF62A19B),
                  value: 4,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                    });
                  },
                  toggleable: true,
                  title: Row(
                    children: [
                      Image.asset("assets/Images/bca.png"),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text("BCA Virtual Account"),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0XFFF4F7F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Theme(
                data: ThemeData(
                  unselectedWidgetColor: const Color(0XFF62A19B),
                ),
                child: RadioListTile(
                  activeColor: const Color(0XFF62A19B),
                  value: 5,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                    });
                  },
                  toggleable: true,
                  title: Row(
                    children: [
                      Image.asset("assets/Images/bni.png"),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: const Text("BNI Mobile"),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Button(
              width: 60,
              height: 60,
              text: "Continue",
              fontSize: 20,
              radius: 100,
              routeTo: LoginScreens.routesName,
            ),
          ],
        ),
      ),
    );
  }
}
