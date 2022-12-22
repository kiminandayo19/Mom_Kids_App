import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/arguments/payments-arg.dart';
import 'package:mom_and_kids_app/screens/Subscriptions/transaction.dart';
import 'package:mom_and_kids_app/Widgets/AppBars/navAppBar.dart';
import '../../Widgets/Button/button.dart';
import '../LoginPage/login_screens.dart';

class Payments extends StatefulWidget {
  static String routesName = "/payments";
  Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  int? val;
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
                      Image.asset("assets/images/mastercard.png"),
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
                      Image.asset("assets/images/paypal.png"),
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
                      Image.asset("assets/images/visa.png"),
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
                      Image.asset("assets/images/bca.png"),
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
                      Image.asset("assets/images/bni.png"),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF62A19B),
                fixedSize: const Size(60, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Transaction.routesName,
                  arguments: PaymentArguments(
                    price: arg.price,
                    val: val,
                  ),
                );
              },
              child: const Text(
                "Continue",
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
    );
  }
}
