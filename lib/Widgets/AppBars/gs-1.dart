import 'package:flutter/material.dart';

import '../../screens/LoginPage/login_screens.dart';

class GS1 extends StatelessWidget implements PreferredSizeWidget {
  const GS1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0XFFFFFFFF),
      shadowColor: null,
      elevation: 0.0,
      leadingWidth: 100,
      automaticallyImplyLeading: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, LoginScreens.routesName);
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: Color(0XFF8EC3B3),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
