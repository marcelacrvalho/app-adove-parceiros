import 'package:app_adove/app/data/repositories/store.dart';
import 'package:app_adove/app/modules/home/controllers/profile.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => StoreRepository());
  }
}