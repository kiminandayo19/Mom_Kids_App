import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:mom_and_kids_app/utils/constant.dart';

// ignore: must_be_immutable
class CombineHyperlinkText extends StatelessWidget {
  String unclickableText;
  String clickableText;
  Color firstColor;
  Color secondColor;
  double fontSize;
  FontWeight fontWeight;
  void Function() onTap;

  CombineHyperlinkText({
    super.key,
    required this.unclickableText,
    required this.clickableText,
    required this.onTap,
    this.firstColor = blackRoot,
    this.secondColor = greenRoot,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: unclickableText,
        style: nunitoNormal(
          color: firstColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
        children: <InlineSpan>[
          TextSpan(
            text: ' $clickableText',
            style: nunitoNormal(
              color: secondColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
