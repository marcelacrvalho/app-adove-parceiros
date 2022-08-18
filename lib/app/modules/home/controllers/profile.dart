import 'package:app_adove/app/data/repositories/store.dart';
import 'package:app_adove/app/global/helpers/dynamic_links.dart';
import 'package:app_adove/app/global/widgets/snackbar/snackbar.dart';
import 'package:app_adove/app/modules/auth/controllers/auth.dart';
import 'package:app_adove/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find<ProfileController>();
  final repository = Get.find<StoreRepository>();
  final box = GetStorage('adove-app');

  TextEditingController? controllerLocation = TextEditingController();
  TextEditingController? controllerStreet = TextEditingController();
  TextEditingController? controllerNeighborhood = TextEditingController();
  TextEditingController? controllerNumber = TextEditingController();

  String openDropdownValue =
      AuthController.to.currentStore.value.open.toString();
  String paymentDropdownValue =
      AuthController.to.currentStore.value.payment.toString();
  bool? homecareRadioValue = AuthController.to.currentStore.value.homecare;

  final openDropdownItems = [
    'De seg a sex, exceto feriados',
    'De seg  sex, incluso feriados',
    'De seg a sáb, exceto feriados',
    'De seg a sáb, incluso feriados',
    'Todos os dias, exceto feriados',
    'Todos os dias, incluso feriados',
    'Apenas nos finais de semana'
  ];
  final paymentDropdownItems = [
    'Dinheiro, cartão e pix',
    'Dinheiro e pix',
    'Dinheiro e cartão'
  ];

  Future updateAdress() async {
    final location = controllerLocation?.text != '' &&
            controllerLocation!.text !=
                AuthController.to.currentStore.value.location
        ? controllerLocation!.text
        : AuthController.to.currentStore.value.location!;
    final street = controllerStreet?.text != '' &&
            controllerStreet!.text !=
                AuthController.to.currentStore.value.street
        ? controllerStreet!.text
        : AuthController.to.currentStore.value.street!;
    final neighborhood = controllerNeighborhood?.text != '' &&
            controllerNeighborhood!.text !=
                AuthController.to.currentStore.value.neighborhood
        ? controllerNeighborhood!.text
        : AuthController.to.currentStore.value.neighborhood!;
    final number = controllerNumber?.text != '' &&
            controllerNumber!.text !=
                AuthController.to.currentStore.value.number
        ? controllerNumber!.text
        : AuthController.to.currentStore.value.number!;

    final response = await repository.updateAddress(
      AuthController.to.currentStore.value.id!,
      location,
      street,
      neighborhood,
      number,
    );
    if (response != null) {
      SnarckBarWidget.showSnack(
        'Tudo certo!',
        'Os dados foram atualizados com sucesso',
      );
    } else {
      SnarckBarWidget.showSnack(
        'Ocorreu um erro',
        'Os dados não foram atualizados com sucesso',
      );
    }
  }

  Future updateInfo() async {
    final response = await repository.updateInfo(
      AuthController.to.currentStore.value.id!,
      homecareRadioValue!,
      paymentDropdownValue,
      openDropdownValue,
    );

    if (response != null) {
      SnarckBarWidget.showSnack(
        'Tudo certo',
        'Os dados foram atualizados com sucesso',
      );
    } else {
      SnarckBarWidget.showSnack(
        'Ocorreu um erro',
        'Os dados não foram atualizados com sucesso',
      );
    }
  }

  void toinfoView() {
    Get.toNamed(Routes.kProfileInfo);
  }

  void toListJobsView() {
    Get.toNamed(Routes.kJobList);
  }

  Future delete() async {
    await repository.updateStatus(AuthController.to.currentStore.value.id!);
    Get.offNamed(Routes.kInitial);
  }

  Future<String?> getAddressDynamicLink() async {
    final url = await CustomDynamicLinks.createDynamicLink(
      AuthController.to.currentStore.value.id!,
    );
    return url;
  }

  void toAddressView() {
    Get.toNamed(Routes.kProfileAddress);
  }
}
