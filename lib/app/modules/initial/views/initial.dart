import 'package:app_adove/app/global/widgets/buttons/icon.dart';
import 'package:app_adove/app/modules/initial/controllers/initial.dart';
import 'package:app_adove/app/modules/initial/widgets/background_color.dart';
import 'package:app_adove/app/modules/initial/widgets/image.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData.scaffoldBackgroundColor,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          PurpleBackgroundInitialWidget(),
          Center(
            child: ImageInitialWidget(
              path: 'assets/images/store-initial.png',
            ),
          ),
          Positioned(
            top: Get.mediaQuery.size.height * 0.8,
            right: Get.mediaQuery.size.width * 0.03,
            child: IconButtonWidget(
              onPressed: InitialController.to.verifyStorage,
            ),
          ),
        ],
      ),
    );
  }
}
