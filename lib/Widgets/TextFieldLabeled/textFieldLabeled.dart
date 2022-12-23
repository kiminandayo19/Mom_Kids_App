import 'package:flutter/material.dart';
import 'package:mom_and_kids_app/utils/constant.dart';

// ignore: must_be_immutable
class TextFieldLabeled extends StatefulWidget {
  TextFieldLabeled({
    Key? key,
    required this.controller,
    required this.inputType,
    required this.hintText,
    this.labelText = '',
    this.width = double.infinity,
  }) : super(key: key);

  TextEditingController controller;
  TextInputType inputType;
  String hintText;
  String labelText;
  double width;

  @override
  State<TextFieldLabeled> createState() => _TextFieldLabeledState();
}

class _TextFieldLabeledState extends State<TextFieldLabeled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: nunitoNormal(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: widget.width,
            height: MediaQuery.of(context).size.height * 0.07,
            child: TextFormField(
              style: nunitoNormal(),
              controller: widget.controller,
              keyboardType: widget.inputType,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
                filled: true,
                fillColor: whiteSystemHeavy,
                hintText: widget.hintText,
                hintStyle: nunitoNormal(
                  color: whitePlaceHolder,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
