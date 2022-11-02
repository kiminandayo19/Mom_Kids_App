import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/screens/register/register_screen.dart';
import '../../Widgets/AppBars/gs-2.dart';
import '../../Widgets/button.dart';

class StuddlerQScreen extends StatefulWidget {
  static String routesName = "/studdler-q-page";

  const StuddlerQScreen({super.key});

  @override
  State<StuddlerQScreen> createState() => _StuddlerQScreenState();
}

class _StuddlerQScreenState extends State<StuddlerQScreen> {
  final _qFormKey = GlobalKey<FormState>();
  String? username;
  int? userage;
  DateTime? getpregnanton;
  int? currentchild;

  TextEditingController txtUserName = TextEditingController();
  TextEditingController txtUserAge = TextEditingController();
  TextEditingController txtGetPregnantOn = TextEditingController();
  TextEditingController txtCurrentChild = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const GS2(),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Little Question",
                      style:
                          TextStyle(fontFamily: "Avenir-Black", fontSize: 32),
                    ),
                    const Text(
                      "To make this app more relevant for you",
                      style: TextStyle(
                        fontFamily: "Avenir-Roman",
                        fontSize: 16,
                        color: Color(0XFF8E8E8E),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    pregnantForm(),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Button(
                        width: 50,
                        height: 80,
                        radius: 100,
                        text: "Continue",
                        fontSize: 16,
                        routeTo: RegisterScreens.routesName,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      // body: PregnantQComponent(),
    );
  }

  Form pregnantForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Name",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: "Avenir-Roman"),
          ),
          const SizedBox(
            height: 9,
          ),
          userName(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Age",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: "Avenir-Roman"),
          ),
          const SizedBox(
            height: 9,
          ),
          userAge(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Getting Given Birth On",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: "Avenir-Roman"),
          ),
          const SizedBox(
            height: 9,
          ),
          userGiveBirthOn(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Name of The Baby",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: "Avenir-Roman"),
          ),
          const SizedBox(
            height: 9,
          ),
          userBabyName(),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Current Number of Child",
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontFamily: "Avenir-Roman"),
          ),
          const SizedBox(
            height: 9,
          ),
          userCurrentChild(),
        ],
      ),
    );
  }

  SizedBox userName() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: txtUserName,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "Suci Hendrawati",
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

  SizedBox userAge() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: txtUserAge,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "29 Years Old",
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

  SizedBox userGiveBirthOn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: txtGetPregnantOn,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "05 April 2022",
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

  SizedBox userBabyName() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: txtCurrentChild,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "Zanna Kirania",
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

  SizedBox userCurrentChild() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: txtCurrentChild,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "1 Child",
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }
}
