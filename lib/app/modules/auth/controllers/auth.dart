import 'package:app_adove/app/data/models/store.dart';
import 'package:app_adove/app/data/repositories/auth.dart';
import 'package:app_adove/app/data/repositories/store.dart';
import 'package:app_adove/app/global/widgets/snackbar/snackbar.dart';
import 'package:app_adove/app/routes/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final repository = Get.find<AuthRepository>();
  final storeRepository = Get.find<StoreRepository>();

  final box = GetStorage('adove-store-app');

  Rx<Store> currentStore = Store().obs;
  TextEditingController controllerEmailLogin = TextEditingController();
  TextEditingController controllerPasswordLogin = TextEditingController();

  Future login() async {
    final response = await repository.login(
      controllerEmailLogin.text,
      controllerPasswordLogin.text,
    );
    if (response != null) {
      final store = Store.fromJson(response);
      currentStore.value = store;
      box.write(
        'adove-store-firebase-token',
        await FirebaseMessaging.instance.getToken(),
      );
      _saveFirebaseToken(box.read('adove-store-firebase-token'));
      final responseEmail = box.read('email-store');

      if (responseEmail != null) {
        if (currentStore.value.active!) {
          Get.toNamed(Routes.kBottomBar);
        } else {
          SnarckBarWidget.showSnack(
            'Eita, ocorreu um erro',
            'Entre em contato com a central pelo e-mail',
          );
        }
      } else {
        box.write('email-store', currentStore.value.email);
        Get.toNamed(Routes.kBottomBar);
      }
    } else {
      SnarckBarWidget.showSnack(
        'Erro ao fazer login',
        'Verifique suas credenciais',
      );
    }
  }

  void toHomeView() {
    Get.toNamed(Routes.kBottomBar);
  }

  void _saveFirebaseToken(token) async {
    await storeRepository.updateToken(currentStore.value.id!, token!);
  }
}
