import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mom_and_kids_app/Widgets/Button/button.dart';
import 'package:mom_and_kids_app/Widgets/CombineHyperLinkText/combineHyperLinkText.dart.dart';
import 'package:mom_and_kids_app/screens/GetStarted/get_started_detail_screen.dart';
import 'package:mom_and_kids_app/screens/LoginPage/login_screens.dart';
import 'package:mom_and_kids_app/utils/constant.dart';

class RegisterScreens extends StatefulWidget {
  static String routesName = "/register-page";
  const RegisterScreens({super.key});

  @override
  State<RegisterScreens> createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens>
    with TickerProviderStateMixin {
  final _regFormKey = GlobalKey();
  dynamic userName,
      userEmail,
      userPassword,
      userDoctorName,
      userDoctorEmail,
      userDoctorPassword;
  int? userDoctorId;
  final _key = GlobalKey<FormState>();
  // String? userName, userEmail, userPassword, userDoctorName, userDoctorEmail, userDoctorPassword, userDoctorId;

  // Doctor Form Controller
  TextEditingController userDoctorNameController = TextEditingController();
  TextEditingController userDoctorEmailController = TextEditingController();
  TextEditingController userDoctorPasswordController = TextEditingController();
  TextEditingController userDoctorIdController = TextEditingController();

  // User Form Controller
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  int current = 0;

  bool value = false;
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> navItems = [
      {"Role": "Doctor", "Icons": "assets/icons/doctor.svg"},
      {"Role": "Personal User", "Icons": "assets/icons/user.svg"},
    ];
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: nunitoNormal(
                      color: blackRoot,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 128,
                    width: 129 * 2 + 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: navItems.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(
                              5,
                            ),
                            width: 128,
                            height: 128,
                            decoration: BoxDecoration(
                              color: whiteSystemHeavy,
                              borderRadius: BorderRadius.circular(10),
                              border: current == index
                                  ? Border.all(
                                      color: greenRoot,
                                      width: 2,
                                    )
                                  : Border.all(
                                      color: transparent,
                                    ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  child: SvgPicture.asset(
                                      navItems[index]["Icons"]!),
                                ),
                                Text(
                                  navItems[index]["Role"]!,
                                  style: nunitoNormal(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: current == 0 ? doctorFormRegist() : userFormRegist(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form doctorFormRegist() {
    return Form(
      key: _key,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          doctorEmail(),
          const SizedBox(
            height: 15,
          ),
          doctorName(),
          const SizedBox(
            height: 15,
          ),
          doctorPassword(),
          const SizedBox(
            height: 15,
          ),
          doctorId(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: value,
                onChanged: (value) {
                  setState(() {
                    this.value = value!;
                  });
                },
                activeColor: const Color(0XFF62A19B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const Text(
                "I agree to all Term, Privacy Policy and Fees",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0XFF808080),
                  fontFamily: "Avenir-Roman",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          CombineHyperlinkText(
            unclickableText: "Already have an account?",
            clickableText: "Login",
            onTap: () {
              Navigator.pushNamed(context, LoginScreens.routesName);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Button(
            onPressed: () => Navigator.pushNamed(context, GetStartedDetail.routesName),
            label: "Sign Up",
            width: 129.0,
            height: 35.0,
            fontSize: 16.0,
          ),
        ],
      ),
    );
  }

  Form userFormRegist() {
    return Form(
      key: _regFormKey,
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          userPersonalEmail(),
          const SizedBox(
            height: 15,
          ),
          userPersonalName(),
          const SizedBox(
            height: 15,
          ),
          userPersonalPassword(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: value,
                onChanged: (value) {
                  setState(() {
                    this.value = value!;
                  });
                },
                activeColor: const Color(0XFF62A19B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const Text(
                "I agree to all Term, Privacy Policy and Fees",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0XFF808080),
                  fontFamily: "Avenir-Roman",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          CombineHyperlinkText(
            unclickableText: "Already have an account?",
            clickableText: "Login",
            onTap: () {
              Navigator.pushNamed(context, LoginScreens.routesName);
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Button(
            onPressed: () => Navigator.pushNamed(context, GetStartedDetail.routesName),
            label: "Sign Up",
            width: 129.0,
            height: 35.0,
            fontSize: 16.0,
          ),
        ],
      ),
    );
  }

// Doctor Forms
  SizedBox doctorEmail() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        validator: (e) {
          if (e!.isEmpty) {
            return "Email tidak boleh kosong";
          }
          return null;
        },
        onSaved: (e) => userDoctorEmail = e,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "Email",
          prefixIcon: const Icon(
            IconData(
              0xf018,
              fontFamily: "MaterialIcons",
            ),
            color: Color(0xFF808080),
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

  SizedBox doctorName() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        validator: (e) {
          if (e!.isEmpty) {
            return "Nama tidak boleh kosong";
          }
          return null;
        },
        onSaved: (e) => userDoctorName = e,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "Username",
          prefixIcon: const Icon(
            IconData(
              0xee72,
              fontFamily: 'MaterialIcons',
            ),
            color: Color(0xFF808080),
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

  SizedBox doctorPassword() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        validator: (e) {
          if (e!.isEmpty) {
            return "Password tidak boleh kosong";
          }
          return null;
        },
        onSaved: (e) => userDoctorPassword = e,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "Password",
          prefixIcon: SvgPicture.asset(
            "assets/icons/password.svg",
            width: 10,
            height: 10,
            fit: BoxFit.scaleDown,
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

  SizedBox doctorId() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        validator: (e) {
          if (e!.isEmpty) {
            return "Id tidak boleh kosong";
          }
          return null;
        },
        onSaved: (e) => userDoctorId = e as int?,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "Doctor ID",
          prefixIcon: SvgPicture.asset(
            "assets/icons/id.svg",
            width: 10,
            height: 10,
            fit: BoxFit.scaleDown,
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

// Personal User Form
  SizedBox userPersonalEmail() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        validator: (e) {
          if (e!.isEmpty) {
            return "Email tidak boleh kosong";
          }
          return null;
        },
        onSaved: (e) => userEmail = e,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "Email",
          prefixIcon: const Icon(
            IconData(
              0xf018,
              fontFamily: "MaterialIcons",
            ),
            color: Color(0xFF808080),
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

  SizedBox userPersonalName() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        validator: (e) {
          if (e!.isEmpty) {
            return "Nama tidak boleh kosong";
          }
          return null;
        },
        onSaved: (e) => userName = e,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "Username",
          prefixIcon: const Icon(
            IconData(
              0xee72,
              fontFamily: "MaterialIcons",
            ),
            color: Color(0xFF808080),
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }

  SizedBox userPersonalPassword() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        validator: (e) {
          if (e!.isEmpty) {
            return "Password tidak boleh kosong";
          }
          return null;
        },
        onSaved: (e) => userPassword = e,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          filled: true,
          fillColor: const Color(0XFFF4F7F8),
          hintText: "Password",
          prefixIcon: SvgPicture.asset(
            "assets/icons/password.svg",
            width: 10,
            height: 10,
            fit: BoxFit.scaleDown,
          ),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontFamily: "Avenir-Roman",
          ),
        ),
      ),
    );
  }
}
