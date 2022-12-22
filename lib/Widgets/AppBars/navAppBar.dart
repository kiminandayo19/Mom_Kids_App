import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/utils/constant.dart';
import 'package:mom_and_kids_app/screens/LoginPage/login_screens.dart';

// ignore: must_be_immutable
class NavAppBar extends StatelessWidget implements PreferredSizeWidget {
  bool useLeading;
  bool useActions;
  NavAppBar({
    super.key,
    required this.useLeading,
    required this.useActions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteRoot,
      shadowColor: null,
      elevation: 0.0,
      leadingWidth: 100.0,
      automaticallyImplyLeading: false,
      leading: useLeading ? const Leading() : null,
      actions: useActions ? const [Actions()] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class Leading extends StatelessWidget {
  const Leading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Row(
          children: const [
            Icon(
              Icons.arrow_back_ios_rounded,
              color: greenNav,
              size: 12,
            ),
            Text(
              "Back",
              style: TextStyle(
                color: greenNav,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Center(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, LoginScreens.routesName),
          child: Text(
            "Skip",
            style: nunitoNormal(
              color: greenNav
            )
          ),
        ),
      ),
    );
  }
}
