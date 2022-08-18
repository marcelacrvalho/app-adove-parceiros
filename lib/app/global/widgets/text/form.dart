import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:flutter/material.dart';

class FormTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscureText;
  final String hinText;
  final bool isFilled;
  final bool twoLines;
  final bool showCountLenght;
  final int maxLenght;

  FormTextWidget({
    required this.controller,
    required this.hinText,
    this.isObscureText = false,
    this.isFilled = false,
    this.showCountLenght = false,
    this.maxLenght = 100,
    this.twoLines = false,
});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: this.controller,
      obscureText: this.isObscureText,
      maxLength: this.showCountLenght ? this.maxLenght : null,
      maxLines: this.twoLines ? 2 : 1,
      decoration: InputDecoration(
        filled: this.isFilled,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
        labelStyle: TextStyle(
          fontSize: kH2,
      ),
        hintText: this.hinText,
      ),
    );
  }
}