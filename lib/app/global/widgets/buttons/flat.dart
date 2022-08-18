import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {

  final String buttonText;
  final onTap;
  final double fontSize;
  final bool isCenterText;

  FlatButtonWidget({
    required this.onTap,
    required this.buttonText,
    required this.fontSize,
    this.isCenterText = false,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: TextWidget(
          text: this.buttonText,
          fontSize: this.fontSize,
          isCenter: this.isCenterText,
        ),
      ),
    );
  }
}