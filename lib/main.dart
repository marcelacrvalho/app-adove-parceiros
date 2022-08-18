import 'package:app_adove/app/routes/app_pages.dart';
import 'package:app_adove/app/routes/app_routes.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/data/notification/custom_notification.dart';
import 'app/modules/initial/bindings/initial.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('adove-store-app');
  CustomNotification.verifyNotification();
  CustomNotification.verifyNotificationBackground();
  CustomNotification.verifyNotificationTerminated();
  runApp(
    GetMaterialApp(
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(seconds: 0),
      title: 'Adove',
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      initialRoute: Routes.kInitial,
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
    ),
  );
}
