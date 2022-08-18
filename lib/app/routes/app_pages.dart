import 'package:app_adove/app/modules/auth/bindings/auth.dart';
import 'package:app_adove/app/modules/auth/views/auth.dart';
import 'package:app_adove/app/modules/home/bindings/bottom_bar.dart';
import 'package:app_adove/app/modules/home/bindings/course.dart';
import 'package:app_adove/app/modules/home/bindings/home.dart';
import 'package:app_adove/app/modules/home/bindings/profile.dart';
import 'package:app_adove/app/modules/home/views/bottom_bar.dart';
import 'package:app_adove/app/modules/home/views/course.dart';
import 'package:app_adove/app/modules/home/views/publication.dart';
import 'package:app_adove/app/modules/home/views/profile_addres.dart';
import 'package:app_adove/app/modules/home/views/profile_info.dart';
import 'package:app_adove/app/modules/initial/bindings/initial.dart';
import 'package:app_adove/app/modules/initial/views/initial.dart';
import 'package:app_adove/app/modules/job/bindings/job.dart';
import 'package:app_adove/app/modules/job/views/job.dart';
import 'package:app_adove/app/modules/job/views/new.dart';
import 'package:app_adove/app/modules/job/views/update.dart';
import 'package:app_adove/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.kInitial,
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.kAuth,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.kBottomBar,
      page: () => BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: Routes.kHomePublication,
      page: () => PublicationView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.kProfileAddress,
      page: () => ProfileAddress(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.kProfileInfo,
      page: () => ProfileInfo(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.kJobList,
      page: () => JobView(),
      binding: JobBinding(),
    ),
    GetPage(
      name: Routes.kNewJob,
      page: () => NewJob(),
      binding: JobBinding(),
    ),
    GetPage(
      name: Routes.kUpdateJob,
      page: () => JobUpdateView(),
      binding: JobBinding(),
    ),
    GetPage(
      name: Routes.kCourse,
      page: () => CourseView(),
      binding: CourseBinding(),
    ),
  ];
}
