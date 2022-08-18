import 'package:app_adove/app/data/repositories/auth.dart';
import 'package:app_adove/app/data/repositories/store.dart';
import 'package:app_adove/app/modules/auth/controllers/auth.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => StoreRepository());
    Get.create(() => AuthRepository());
  }
}
