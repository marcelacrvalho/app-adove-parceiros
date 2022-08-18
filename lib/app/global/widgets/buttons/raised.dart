import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:flutter/material.dart';

class RaisedButtonWidget extends StatelessWidget {

  final onTap;
  final double height;
  final double width;
  final String buttonText;
  final double fontSize;
  final bool isCenterText;
  final Color fontColor;
  final Color buttonColor;
  final bool isBoldButtonText;
  final String fontFamily;

  RaisedButtonWidget({
    required this.onTap,
    required this.height,
    required this.buttonText,
    required this.fontSize,
    required this.buttonColor,
    this.isCenterText = true,
    this.fontColor = Colors.white,
    this.width = double.infinity,
    this.isBoldButtonText = false,
    this.fontFamily = 'Myriad',
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Material(
        elevation: 0.0,
        borderRadius: BorderRadius.circular(8.0),
        color: this.buttonColor,
        child: Container(
          width: this.width,
          height: this.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextWidget(
                text: this.buttonText,
                fontSize: this.fontSize,
                isCenter: this.isCenterText,
                isBold: this.isBoldButtonText,
                fontColor: this.fontColor,
                fontFamily: this.fontFamily,
              ),
            ),
          ),
        ),
      ),
    );
  }
}