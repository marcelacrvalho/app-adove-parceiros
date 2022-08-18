import 'package:app_adove/app/modules/home/views/home.dart';
import 'package:app_adove/app/modules/home/views/profile.dart';
import 'package:app_adove/app/modules/home/views/schedule.dart';
import 'package:get/get.dart';

import '../views/course.dart';

class BottomBarController extends GetxController {
  static BottomBarController get to => Get.find<BottomBarController>();

  int index = 1;
  final List pages = [
    ScheduleView(),
    HomeView(),
    ProfileView(),
    CourseView(),
  ];
}
