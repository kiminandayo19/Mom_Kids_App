import 'package:flutter/material.dart';

class GS3 extends StatelessWidget implements PreferredSizeWidget {
  const GS3({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0XFFFFFFFF),
      shadowColor: null,
      elevation: 0.0,
      leadingWidth: 100,
      leading: Container(
        padding: const EdgeInsets.only(left: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back_ios_rounded,
                color: Color(0XFF8EC3B3),
                size: 12,
              ),
              Text(
                "Back",
                style: TextStyle(
                  color: Color(0XFF8EC3B3),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
