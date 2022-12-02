import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mom_and_kids_app/screens/home/main_home.dart';

import '../../Widgets/to_signup.dart';

class LoginScreens extends StatefulWidget {
  static String routesName = "/login-page";
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginScreensState extends State<LoginScreens>
    with TickerProviderStateMixin {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  int current = 0;
  String? userEmail,
      userPassword,
      userDoctorEmail,
      userDoctorPassword,
      userDoctorId;
  final _key = GlobalKey<FormState>();

  // Doctor Form Controller
  TextEditingController userDoctorEmailController = TextEditingController();
  TextEditingController userDoctorPasswordController = TextEditingController();

  // User Form Controller
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState!;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    String apiurl = "http://192.168.1.9/momkids/login.php"; //api url
    //dont use http://localhost , because emulator don't get that address
    //instead use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    final response = await http.post(Uri.parse(apiurl), body: {
      'userEmail': userEmailController.text, //get the username text
      'userPassword': userPasswordController.text, //get password text
      'userDoctorEmail':
          userDoctorEmailController.text, //get the doctor username text
      'userDoctorPassword':
          userDoctorPasswordController.text //get doctor password text
    });

    final data = json.decode(response.body);
    int value = data['value'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value);
      });
      Fluttertoast.showToast(
          msg: "Login Berhasil.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.green,
          fontSize: 25.0);
    } else {
      Fluttertoast.showToast(
          msg: "Login Gagal.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          textColor: Colors.red,
          fontSize: 25.0);
    }
  }

  savePref(int value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setInt("value", value);
    });
  }

  var valuePref;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      valuePref = pref.getInt("valuePref");

      _loginStatus =
          valuePref == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.remove("value");
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> navItems = [
      {"Role": "Doctor", "Icons": "assets/icons/doctor.svg"},
      {"Role": "Personal User", "Icons": "assets/icons/user.svg"},
    ];
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
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
                  maxHeight: MediaQuery.of(context).size.height,
                ),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.1,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Choose Account Type",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Avenir-Black",
                          fontWeight: FontWeight.bold,
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
                                  color: const Color(0XFFF4F7F8),
                                  borderRadius: BorderRadius.circular(10),
                                  border: current == index
                                      ? Border.all(
                                          color: const Color(0XFF62A19B),
                                          width: 2,
                                        )
                                      : Border.all(
                                          color: Colors.transparent,
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
                                      style: const TextStyle(
                                        fontFamily: "Avenir-Roman",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: current == 0
                            ? doctorFormRegist()
                            : userFormRegist(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      case LoginStatus.signIn:
        return Screens(signOut, userEmailController.text);
    }
  }

  Form doctorFormRegist() {
    return Form(
      key: _key,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Hello Doctor!",
            style: TextStyle(
              fontFamily: "Avenir-Roman",
              fontSize: 14,
              color: Color(0XFF808080),
            ),
          ),
          const Text(
            "Please fill out the form below to get started",
            style: TextStyle(
              fontFamily: "Avenir-Roman",
              fontSize: 14,
              color: Color(0XFF808080),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          doctorEmail(),
          const SizedBox(
            height: 15,
          ),
          doctorPassword(),
          const SizedBox(
            height: 20,
          ),
          const ToSignUpText(),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF62A19B),
              fixedSize: const Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Screens(signOut, userDoctorEmailController.text),
                ),
              );
            },
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          // ButtonBar(
          //   children: <Widget>[
          //     ElevatedButton.icon(
          //         onPressed: () {
          //           check();
          //         },
          //         icon: const Icon(Icons.arrow_forward),
          //         label: const Text('Login')),
          //   ],
          // ),
        ],
      ),
    );
  }

  Form userFormRegist() {
    return Form(
      key: _key,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Hello Mom!",
            style: TextStyle(
              fontFamily: "Avenir-Roman",
              fontSize: 14,
              color: Color(0XFF808080),
            ),
          ),
          const Text(
            "Please fill out the form below to get started",
            style: TextStyle(
              fontFamily: "Avenir-Roman",
              fontSize: 14,
              color: Color(0XFF808080),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          userPersonalEmail(),
          const SizedBox(
            height: 15,
          ),
          userPersonalPassword(),
          const SizedBox(
            height: 20,
          ),
          const ToSignUpText(),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF62A19B),
              fixedSize: const Size(100, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      Screens(signOut, userEmailController.text),
                ),
              );
            },
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          // ButtonBar(
          //   children: <Widget>[
          //     ElevatedButton.icon(
          //         onPressed: () {
          //           check();
          //         },
          //         icon: const Icon(Icons.arrow_forward),
          //         label: const Text('Login')),
          //   ],
          // ),
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

  // SizedBox doctorName() {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     height: MediaQuery.of(context).size.height * 0.07,
  //     child: TextFormField(
  //       controller: userDoctorNameController,
  //       keyboardType: TextInputType.text,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //           borderSide: const BorderSide(width: 0, style: BorderStyle.none),
  //         ),
  //         filled: true,
  //         fillColor: const Color(0XFFF4F7F8),
  //         hintText: "Username",
  //         prefixIcon: const Icon(
  //           IconData(
  //             0xee72,
  //             fontFamily: 'MaterialIcons',
  //           ),
  //           color: Color(0xFF808080),
  //         ),
  //         hintStyle: const TextStyle(
  //           fontSize: 16,
  //           fontFamily: "Avenir-Roman",
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
        obscureText: _secureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          suffixIcon: IconButton(
            onPressed: showHide,
            icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
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

  // SizedBox doctorId() {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     height: MediaQuery.of(context).size.height * 0.07,
  //     child: TextFormField(
  //       onSaved: (e)=>userDoctorId = e,
  //       keyboardType: TextInputType.number,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //           borderSide: const BorderSide(width: 0, style: BorderStyle.none),
  //         ),
  //         filled: true,
  //         fillColor: const Color(0XFFF4F7F8),
  //         hintText: "Doctor ID",
  //         prefixIcon: SvgPicture.asset(
  //           "assets/icons/id.svg",
  //           width: 10,
  //           height: 10,
  //           fit: BoxFit.scaleDown,
  //         ),
  //         hintStyle: const TextStyle(
  //           fontSize: 16,
  //           fontFamily: "Avenir-Roman",
  //         ),
  //       ),
  //     ),
  //   );
  // }

// Personal User Form
  SizedBox userPersonalEmail() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextFormField(
        controller: userEmailController,
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

  // SizedBox userPersonalName() {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     height: MediaQuery.of(context).size.height * 0.07,
  //     child: TextFormField(
  //       controller: userNameController,
  //       keyboardType: TextInputType.text,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //           borderSide: const BorderSide(width: 0, style: BorderStyle.none),
  //         ),
  //         filled: true,
  //         fillColor: const Color(0XFFF4F7F8),
  //         hintText: "Username",
  //         prefixIcon: const Icon(
  //           IconData(
  //             0xee72,
  //             fontFamily: "MaterialIcons",
  //           ),
  //           color: Color(0xFF808080),
  //         ),
  //         hintStyle: const TextStyle(
  //           fontSize: 16,
  //           fontFamily: "Avenir-Roman",
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
        obscureText: _secureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          suffixIcon: IconButton(
            onPressed: showHide,
            icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
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
