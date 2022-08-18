import 'package:app_adove/app/data/repositories/event.dart';
import 'package:app_adove/app/modules/home/controllers/schedule.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScheduleController());
    Get.lazyPut(() => EventRepository());
  }
}