import 'package:app_adove/app/data/repositories/auth.dart';
import 'package:app_adove/app/data/repositories/store.dart';
import 'package:app_adove/app/modules/auth/controllers/auth.dart';
import 'package:app_adove/app/modules/initial/controllers/initial.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InitialController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => StoreRepository());
  }
}
