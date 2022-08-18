import 'package:app_adove/app/global/helpers/dynamic_links.dart';
import 'package:app_adove/app/modules/auth/controllers/auth.dart';
import 'package:app_adove/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialController extends GetxController {
  static InitialController get to => Get.find<InitialController>();

  final box = GetStorage('adove-app');

  void verifyStorage() {
    final responseEmail = box.read('email-store');
    if (responseEmail != null) {
      AuthController.to.controllerEmailLogin.text = responseEmail;
      toAuthView();
    } else {
      toAuthView();
    }
  }

  void toAuthView() {
    Get.toNamed(Routes.kAuth);
  }
}
