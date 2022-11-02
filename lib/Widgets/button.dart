import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  // Button Props
  final dynamic routeTo;
  final double height;
  final double width;
  final double radius;
  final String text;
  final double fontSize;

  const Button(
      {this.routeTo,
      required this.width,
      required this.height,
      required this.radius,
      required this.text,
      required this.fontSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0XFF62A19B),
          minimumSize: const Size(200, 40),
          maximumSize: const Size(400, 100),
          fixedSize: Size(height, width),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, routeTo);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
