import 'package:app_adove/app/data/repositories/job.dart';
import 'package:app_adove/app/modules/job/controllers/job.dart';
import 'package:get/get.dart';

class JobBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JobController());
    Get.create(() => JobRepository());
  }
}