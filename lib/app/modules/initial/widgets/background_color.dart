import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurpleBackgroundInitialWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.mediaQuery.size.height * 0.5,
          width: double.infinity,
          color: appThemeData.primaryColor,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: Get.mediaQuery.size.height * 0.09,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: _titleRow(),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: 'adove',
          fontSize: Get.mediaQuery.size.height * 0.030,
          fontFamily: 'Made',
          fontColor: appThemeData.scaffoldBackgroundColor,
        ),
        TextWidget(
          text: 'adove',
          fontSize: Get.mediaQuery.size.height * 0.030,
          fontFamily: 'Made',
          fontColor: appThemeData.scaffoldBackgroundColor,
        ),
        TextWidget(
          text: 'adove',
          fontSize: Get.mediaQuery.size.height * 0.030,
          fontFamily: 'Made',
          fontColor: appThemeData.scaffoldBackgroundColor,
        ),
        TextWidget(
          text: 'adove',
          fontSize: Get.mediaQuery.size.height * 0.030,
          fontFamily: 'Made',
          fontColor: appThemeData.scaffoldBackgroundColor,
        ),
      ],
    );
  }
}
