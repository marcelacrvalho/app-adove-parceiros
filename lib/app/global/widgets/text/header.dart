import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class HeaderTextWidget extends StatelessWidget {
  final bool visibleSearchIcon;

  HeaderTextWidget({
    this.visibleSearchIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.mediaQuery.size.height * 0.12,
      width: double.infinity,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Align(
              alignment: Alignment.topLeft,
              child: Icon(
                LineIcons.arrowLeft,
                size: Get.size.height * 0.035,
                color: appThemeData.primaryColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextWidget(
              text: 'adove', 
              fontSize: kH1 + 2,
              fontFamily: 'Made',
              isCenter: false,
              fontColor: appThemeData.primaryColor,
              ),
          ),
        ],
      ),
    );
  }
}
