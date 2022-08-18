import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class IconButtonWidget extends StatelessWidget {
  final onPressed;
  final IconData? icon;

  IconButtonWidget({required this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        height: Get.mediaQuery.size.height * 0.12,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Icon(
            this.icon ?? LineIcons.arrowRight,
            size: Get.mediaQuery.size.width * 0.09,
            color: appThemeData.primaryColor,
          ),
        ),
      ),
    );
  }
}
