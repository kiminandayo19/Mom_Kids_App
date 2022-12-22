import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/utils/constant.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  void Function() onPressed;
  double height;
  double width;
  double borderRadius;
  double fontSize;
  String label;
  FontWeight fontWeight;
  Color color;

  Button({
    super.key,
    required this.onPressed,
    this.height = 53.0,
    this.width = 331.0,
    this.borderRadius = 20.0,
    this.fontSize = 24.0,
    this.label = '',
    this.fontWeight = FontWeight.w700,
    this.color = whiteRoot,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: greenMassive,
        fixedSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      child: Text(
        label,
        style: nunitoNormal(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}
