import 'package:app_adove/app/data/models/event.dart';
import 'package:app_adove/app/data/notification/custom_notification.dart';
import 'package:app_adove/app/data/repositories/event.dart';
import 'package:app_adove/app/modules/auth/controllers/auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleController extends GetxController {
  static ScheduleController get to => Get.find<ScheduleController>();
  final repository = Get.find<EventRepository>();

  String? dateFormated;
  RxList<Event>? listEvents = <Event>[].obs;
  Rx<Event> currentEvent = Event().obs;

  @override
  void onInit() {
    events();
    super.onInit();
  }

  String dateString(String date) {
    DateTime dateParse = DateTime.parse(date);
    dateFormated =
        DateFormat("dd 'de' MMMM 'de' yyy", 'pt_BR').format(dateParse);
    return dateFormated.toString();
  }

  Future events() async {
    int? idStore = AuthController.to.currentStore.value.id;
    if (idStore != null) {
      final response =
          await repository.getEvents(AuthController.to.currentStore.value.id!);
      if (response != null) {
        listEvents?.value = response;
      }
    }
  }

  Future cancel() async {
    await repository.deleteEvent(currentEvent.value.id!);
    CustomNotification.sendAndRetrieveMessage(
      'Infelizmente, seu agendamento foi desmarcado',
      'Que tal remarcar para um outro dia?',
      token: currentEvent.value.user!.firebaseToken,
    );
  }

  Future delete() async {
    await repository.deleteEvent(currentEvent.value.id!);
  }
}
