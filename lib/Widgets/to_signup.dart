import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../screens/register/register_screen.dart';

class ToSignUpText extends StatelessWidget {
  const ToSignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Didn't have account? ",
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: "Sign Up",
            style: const TextStyle(
              color: Color(0XFF62A19B),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(
                    context, RegisterScreens.routesName);
              },
          ),
        ],
      ),
    );
  }
}
