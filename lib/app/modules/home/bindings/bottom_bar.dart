import 'package:app_adove/app/data/repositories/event.dart';
import 'package:app_adove/app/data/repositories/publication.dart';
import 'package:app_adove/app/data/repositories/store.dart';
import 'package:app_adove/app/modules/home/controllers/bottom_bar.dart';
import 'package:app_adove/app/modules/home/controllers/course.dart';
import 'package:app_adove/app/modules/home/controllers/home.dart';
import 'package:app_adove/app/modules/home/controllers/profile.dart';
import 'package:app_adove/app/modules/home/controllers/schedule.dart';
import 'package:get/get.dart';

class BottomBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomBarController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ScheduleController());
    Get.lazyPut(() => ProfileController());
    Get.create(() => EventRepository());
    Get.lazyPut(() => PublicationRepository());
    Get.lazyPut(() => StoreRepository());
    Get.lazyPut(() => CourseController());
  }
}
