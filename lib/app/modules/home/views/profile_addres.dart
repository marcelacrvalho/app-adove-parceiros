import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/buttons/raised.dart';
import 'package:app_adove/app/global/widgets/text/header.dart';
import 'package:app_adove/app/global/widgets/text/form.dart';
import 'package:app_adove/app/global/widgets/text/suggestion_city.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/auth/controllers/auth.dart';
import 'package:app_adove/app/modules/home/controllers/profile.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';

class ProfileAddress extends StatelessWidget {
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
        padding: EdgeInsets.all(16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            HeaderTextWidget(),
            TextWidget(
              text: 'Onde se localiza seu estabelecimento?', 
              fontSize: kH2,
              ),
            Divider(),
            TextSuggestionCityWidget(),
            Divider(),
            TextWidget(
              text: 'Qual é o nome da rua?', 
              fontSize: kH2,
              ),
            Divider(),
            FormTextWidget(
              hinText: AuthController.to.currentStore.value.street.toString(),
              controller: ProfileController.to.controllerStreet!,
            ),
            Divider(),
            TextWidget(
              text: 'Qual é o bairro?', 
              fontSize: kH2,
              ),
            Divider(),
            FormTextWidget(
              hinText: AuthController.to.currentStore.value.neighborhood
                  .toString(),
              controller: ProfileController.to.controllerNeighborhood!,
            ),
            Divider(),
            TextWidget(
              text: 'E o número?', 
              fontSize: kH2,
              ),
            Divider(),
            FormTextWidget(
              hinText: AuthController.to.currentStore.value.number.toString(),
              controller: ProfileController.to.controllerNumber!,
            ),
            Divider(),
            RaisedButtonWidget(
              onTap: ProfileController.to.updateAdress,
              height: kBigButton,
              buttonText: 'Prontinho',
              fontSize: kH2,
              buttonColor: appThemeData.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
