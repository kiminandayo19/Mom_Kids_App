import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mom_and_kids_app/Widgets/to_login.dart';
// import 'package:mom_and_kids_app/screens/LoginPage/login_screens.dart';

class RegisterScreens extends StatefulWidget {
  static String routesName = "/register-page";
  const RegisterScreens({super.key});

  @override
  State<RegisterScreens> createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens>
    with TickerProviderStateMixin {
  final _regFormKey = GlobalKey();
  dynamic? userName,
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

  bool _secureText = true;

  // Future regist() async {
  //   try {
  //     return await http.post(
  //         Uri.parse("http://192.168.28.81/momkids_testing/create.php"),
  //         body: {
  //           'nama': userInputController.text,
  //           'pass': userPassController.text,
  //         }).then((value) {
  //       var data = jsonDecode(value.body);
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future register() async {
    String apiurl = "http://192.168.28.81/momkids_testing/create.php";
    try {
      return await http.post(Uri.parse(apiurl), body: {
        'nama': userNameController.text,
        'pass': userPasswordController.text,
        'email': userEmailController.text,
      }).then((value) {
        var data = jsonDecode(value.body);
      });
    } catch (e) {
      print(e);
    }
  }

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }
  // String apiurl = "http://192.168.28.81/momkids_testing/create.php";
  // try {
  //   return await http.post(Uri.parse(apiurl), body: {
  //     'nama': userNameController.text,
  //     'pass': userPasswordController.text,
  //     'email': userEmailController.text,
  //   }).then((value) {
  //     var data = jsonDecode(value.body);
  //   });
  // } catch (e) {
  //   print(e);
  //   showHide() {
  //     setState(() {
  //       _secureText = !_secureText;
  //     });
  //   }

  // register() async {
  //   String apiurl = "http://192.168.1.9/momkids/register.php"; //api url
  //   //dont use http://localhost , because emulator don't get that address
  //   //instead use your local IP address or use live URL
  //   //hit "ipconfig" in windows or "ip a" in linux to get you local IP
  //   final response = await http.post(Uri.parse(apiurl), body: {
  //     'userEmail': userEmail, //get the username text
  //     'userPassword': userPassword, //get password text
  //     'userDoctorEmail': userDoctorEmail, //get the doctor username text
  //     'userDoctorPassword': userDoctorPassword, //get doctor password text
  //     'userDoctorId': userDoctorId //get doctor id text
  //   });
  //   final data = json.decode(response.body);
  //   int value = data['value'];
  //   if (value == 1) {
  //     setState(() {
  //       Navigator.pop(context);
  //     });
  //     Fluttertoast.showToast(
  //         msg: "Akun anda berhasil didaftarkan.",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         textColor: Colors.green,
  //         fontSize: 25.0);
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "Email sudah terdaftar.",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         textColor: Colors.red,
  //         fontSize: 25.0);
  //   }
  // }

  check() {
    final form = _key.currentState!;
    if (form.validate()) {
      form.save();
      register();
    }
  }

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
                  const Text(
                    "Sign Up",
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
          const ToLoginText(),
          const SizedBox(
            height: 10,
          ),
          ButtonBar(
            children: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {
                    check();
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Sign Up')),
            ],
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
          const ToLoginText(),
          const SizedBox(
            height: 10,
          ),
          ButtonBar(
            children: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {
                    check();
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Sign Up')),
            ],
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
        obscureText: _secureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          ),
          suffixIcon: IconButton(
            onPressed: showHide(),
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
