import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/buttons/raised.dart';
import 'package:app_adove/app/global/widgets/text/form.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/auth/controllers/auth.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                  text: 'Você voltou!',
                  fontSize: kH2,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                  text: 'Sentimos sua falta <3',
                  fontSize: kH2,
                  fontColor: Colors.grey,
                ),
              ),
              Divider(),
              FormTextWidget(
                controller: AuthController.to.controllerEmailLogin,
                hinText: AuthController.to.controllerEmailLogin.text != ''
                    ? AuthController.to.controllerEmailLogin.text
                    : 'Seu e-mail',
              ),
              Divider(),
              FormTextWidget(
                controller: AuthController.to.controllerPasswordLogin,
                hinText: 'Sua senha',
                isObscureText: true,
              ),
              Divider(),
              RaisedButtonWidget(
                onTap: AuthController.to.login,
                height: kBigButton,
                buttonText: 'Vamos lá',
                fontSize: kH2,
                buttonColor: appThemeData.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
