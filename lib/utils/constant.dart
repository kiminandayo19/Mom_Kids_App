import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Palette - Green
const greenMassive = Color(0XFF37A2A5);
const greenHeavy = Color(0XFF65A39C);
const greenRoot = Color(0XFF62A19B);
const greenNav = Color(0XFF497974);

// Palette - White
const whiteMassive = Color(0XFFF5F5F5);
const whiteSoft = Color(0XFFF0F5F5);
const whitePlaceHolder = Color(0XFFA7A7A7);
const whiteSystemHeavy = Color(0XFFF4F7F8);

// Palette - Orange
const orangeMassive = Color(0XFFD95A3F);
const orangeHeavy = Color(0XFFFF725E);
const orangeSoft = Color(0XFFF5907B);

// Palette - Black
const blackRoot = Color(0XFF000000);
const blackSoft = Color.fromRGBO(0, 0, 0, 0.5);

// Width & Height
var deviceWidth = (BuildContext context) {
  return MediaQuery.of(context).size.height;
};
var deviceHeight = (BuildContext context) {
  return MediaQuery.of(context).size.width;
};

// Fonts
var nunitoNormal = ({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  Color color = blackRoot,
}) {
  return GoogleFonts.nunito(
    fontStyle: FontStyle.normal,
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
};
