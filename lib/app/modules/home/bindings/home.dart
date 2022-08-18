import 'package:app_adove/app/data/repositories/job.dart';
import 'package:app_adove/app/data/repositories/publication.dart';
import 'package:app_adove/app/modules/home/controllers/home.dart';
import 'package:app_adove/app/modules/job/controllers/job.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => PublicationRepository());
    Get.lazyPut(() => JobController());
    Get.lazyPut(() => JobRepository());
  }
}