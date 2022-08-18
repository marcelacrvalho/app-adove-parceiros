import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/home/controllers/home.dart';
import 'package:app_adove/app/modules/home/widgets/publications_home.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: 'Novidades para você',
                fontSize: kH2,
              ),
            ),
            Divider(),
            Flexible(
              flex: 2,
              child: Container(
                height: Get.mediaQuery.size.height * 0.8,
                child: GetX(
                  init: HomeController(),
                  initState: (_) => HomeController.to.publications(),
                  didUpdateWidget: (__, _) => HomeController.to.publications(),
                  builder: (_) => _publicationsList(),
                ),
              ),
            ),
            Center(
              child: FloatingActionButton.extended(
                onPressed: HomeController.to.toJobView,
                backgroundColor: appThemeData.primaryColor,
                label: TextWidget(
                  text: 'Adicionar serviço',
                  fontSize: kH2,
                  fontColor: appThemeData.scaffoldBackgroundColor,
                ),
                icon: Icon(
                  LineIcons.plus,
                  color: appThemeData.scaffoldBackgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _publicationsList() {
    return HomeController.to.listPublications!.isNotEmpty ||
            HomeController.to.listPublications != null
        ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: HomeController.to.listPublications!.length,
            itemBuilder: (context, index) {
              return PublicationsDesignHomeWidget(
                  HomeController.to.listPublications![index]);
            })
        : Container(
            alignment: Alignment.center,
            width: Get.width * 0.25,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/images/loading.png',
                fit: BoxFit.contain,
              ),
            ),
          );
  }
}
