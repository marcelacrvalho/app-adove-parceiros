import 'package:app_adove/app/data/models/publication.dart';
import 'package:app_adove/app/data/repositories/publication.dart';
import 'package:app_adove/app/modules/job/bindings/job.dart';
import 'package:app_adove/app/modules/job/views/new.dart';
import 'package:app_adove/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();
  final repository = Get.find<PublicationRepository>();

  RxList<Publication>? listPublications = <Publication>[].obs;
  Rx<Publication> currentPublication = Publication().obs;

  Future publications() async {
    final response = await repository.publications();
    listPublications!.value = response;
  }

  Future updateddress() async {}

  void toPublicationView(Publication publication) {
    currentPublication.value = publication;
    Get.toNamed(Routes.kHomePublication);
  }

  void toJobView() {
    Get.to(
      () => NewJob(),
      transition: Transition.downToUp,
      binding: JobBinding(),
    );
  }
}
