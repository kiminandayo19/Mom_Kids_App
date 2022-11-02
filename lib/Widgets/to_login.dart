import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../screens/LoginPage/login_screens.dart';

class ToLoginText extends StatelessWidget {
  const ToLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Already have an account? ",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: "Log in",
            style: const TextStyle(
              color: Color(0XFF62A19B),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, LoginScreens.routesName);
              },
          ),
        ],
      ),
    );
  }
}
