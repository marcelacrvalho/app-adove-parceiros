import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardIconProfileWidget extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final void Function()? onTap;

  CardIconProfileWidget({ @required this.text, @required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Card(
        elevation: 3.0,
        color: appThemeData.primaryColor,
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(16.0),
                width: Get.mediaQuery.size.width * 0.35,
                height: Get.mediaQuery.size.height * 0.1,
                child: TextWidget(
                  text: this.text.toString(),
                  fontSize: kH2,
                  fontColor: appThemeData.scaffoldBackgroundColor,
                  isCenter: true,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: appThemeData.primaryColor,
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Icon(
                this.icon,
                size: Get.mediaQuery.size.height * 0.06,
                color: appThemeData.scaffoldBackgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
