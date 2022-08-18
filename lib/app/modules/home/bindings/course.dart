import 'package:app_adove/app/modules/home/controllers/course.dart';
import 'package:get/get.dart';

class CourseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CourseController());
  }
}
