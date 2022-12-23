import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/Widgets/Button/button.dart';
import 'package:mom_and_kids_app/Widgets/TextFieldLabeled/textFieldLabeled.dart';
import 'package:mom_and_kids_app/screens/register/register_screen.dart';
import 'package:mom_and_kids_app/Widgets/AppBars/navAppBar.dart';
import 'package:mom_and_kids_app/utils/constant.dart';

class PreqQScreen extends StatefulWidget {
  static String routesName = "/preg-q-page";

  const PreqQScreen({super.key});

  @override
  State<PreqQScreen> createState() => _PreqQScreenState();
}

class _PreqQScreenState extends State<PreqQScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController datePregnant = TextEditingController();
  TextEditingController estimatedBirth = TextEditingController();
  TextEditingController mensPeriod = TextEditingController();
  TextEditingController currentChild = TextEditingController();
  TextEditingController childHeight = TextEditingController();
  TextEditingController childWeight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: NavAppBar(
        useLeading: true,
        useActions: true,
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
                    Text(
                      "Little Question",
                      style: nunitoNormal(
                        fontSize: 32.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "To make this app more relevant for you",
                      style: nunitoNormal(
                        color: whitePlaceHolder,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    pregnantForm(),
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
          TextFieldLabeled(
            labelText: 'Name',
            controller: nameController,
            inputType: TextInputType.text,
            hintText: 'Suci Hendrawati',
          ),
          TextFieldLabeled(
            labelText: 'Age',
            controller: ageController,
            inputType: TextInputType.text,
            hintText: '28 Years Old',
          ),
          TextFieldLabeled(
            labelText: 'Getting Pregnant On',
            controller: datePregnant,
            inputType: TextInputType.text,
            hintText: '02 July 2022',
          ),
          TextFieldLabeled(
            labelText: 'Estimated Birth',
            controller: estimatedBirth,
            inputType: TextInputType.text,
            hintText: '02 April 2023',
          ),
          TextFieldLabeled(
            labelText: 'Last Menstrual Period',
            controller: mensPeriod,
            inputType: TextInputType.text,
            hintText: '01 July 2022',
          ),
          TextFieldLabeled(
            labelText: 'Current Number of Child',
            controller: currentChild,
            inputType: TextInputType.text,
            hintText: '1 Child',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
