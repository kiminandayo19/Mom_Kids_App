import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/screens/register/register_screen.dart';
import 'package:mom_and_kids_app/Widgets/AppBars/navAppBar.dart';
import '../../Widgets/Button/button.dart';

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
  TextEditingController txtNameBaby = TextEditingController();
  TextEditingController txtCurrentChild = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavAppBar(
        useActions: true,
        useLeading: true,
      ),
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
                    // Center(
                    //   child: Button(
                    //     width: 50,
                    //     height: 80,
                    //     radius: 100,
                    //     text: "Continue",
                    //     fontSize: 16,
                    //     routeTo: RegisterScreens.routesName,
                    //   ),
                    // ),
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
      key: _qFormKey,
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
          textForm(
            txtUserName,
            TextInputType.text,
            "Suci Hendrawati",
          ),
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
          textForm(
            txtUserAge,
            TextInputType.text,
            "29 Years Old",
          ),
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
          textForm(
            txtGetPregnantOn,
            TextInputType.text,
            "05 April 2022",
          ),
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
          textForm(
            txtNameBaby,
            TextInputType.text,
            "1 Child",
          ),
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
          textForm(
            txtCurrentChild,
            TextInputType.text,
            "1 Child",
          ),
        ],
      ),
    );
  }

  SizedBox textForm(
    TextEditingController? controllerName,
    TextInputType? inputType,
    String? hintText,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: controllerName,
        keyboardType: inputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }
}
