import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/buttons/flat.dart';
import 'package:app_adove/app/global/widgets/buttons/raised.dart';
import 'package:app_adove/app/global/widgets/text/form.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/job/controllers/job.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class NewJob extends StatelessWidget {
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
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Lottie.asset(
                'assets/animations/animation-cat.json',
                height: Get.mediaQuery.size.height * 0.15,
              ),
            ),
            Divider(),
            TextWidget(
            text: 'Nome do serviço oferecido', 
            fontSize: kH2,
            ),
            Divider(),
            FormTextWidget(
              controller: JobController.to.controllerJob,
              hinText: 'Exemplo: Peeling de Diamante',
            ),
            Divider(),
            TextWidget(
            text: 'Preço do serviço, sem R\$', 
            fontSize: kH2,
            ),
            Divider(),
            FormTextWidget(
              controller: JobController.to.controllerPrice,
              hinText: 'Exemplo: 500/sessão. 100/mês',
            ),
            Divider(),
            TextWidget(
            text: 'Descreva o que você oferece', 
            fontSize: kH2,
            ),
            Divider(),
            FormTextWidget(
              controller: JobController.to.controllerDescription,
              hinText: 'Exemplo: Retire manchas de cicatrizes de forma rápida e indolor',
              twoLines: true,
              showCountLenght: true,
            ),
            Divider(),
            RaisedButtonWidget(
              onTap: JobController.to.newJob,
              height: kBigButton,
              buttonText: 'Pronto',
              fontSize: kH2,
              buttonColor: appThemeData.primaryColor,
            ),
            Divider(),
            Center(
              child: FlatButtonWidget(
                onTap: () => Get.back(),
                buttonText: 'Cancelar',
                fontSize: kH2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
