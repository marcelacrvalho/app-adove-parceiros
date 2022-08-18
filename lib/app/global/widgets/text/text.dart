import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final bool isCenter;
  final double fontSize;
  final bool isBold;
  final String fontFamily;
  final Color fontColor;

  TextWidget({
    required this.text,
    required this.fontSize,
    this.isCenter = false,
    this.isBold = false,
    this.fontFamily = 'Myriad',
    this.fontColor = Colors.black,
});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: this.isCenter ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        fontSize: this.fontSize,
        color: this.fontColor,
        fontWeight: this.isBold ? FontWeight.bold : FontWeight.normal,
        fontFamily: this.fontFamily,
      ),
    );
  }
}
