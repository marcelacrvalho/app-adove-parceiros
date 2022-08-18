import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/buttons/raised.dart';
import 'package:app_adove/app/global/widgets/text/header.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/home/controllers/profile.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
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
          children: [
            HeaderTextWidget(),
            TextWidget(
              text: 'Você vai até a casa do cliente?',
              fontSize: kH2,
            ),
            Divider(),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 200,
                height: Get.mediaQuery.size.height * 0.07,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: _radioHomecare('Sim', true),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: _radioHomecare('Não', false),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            TextWidget(
              text: 'Dias em que seu estabelecimento está aberto',
              fontSize: kH2,
            ),
            Divider(),
            _dropdownOpen(),
            Divider(),
            TextWidget(
              text: 'Meios de pagamento',
              fontSize: kH2,
            ),
            Divider(),
            _dropdownPayment(),
            Divider(),
            RaisedButtonWidget(
              onTap: ProfileController.to.updateInfo,
              height: kBigButton,
              buttonText: 'Salvar alterações',
              fontSize: kH2,
              buttonColor: appThemeData.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _radioHomecare(String title, bool value) {
    return RadioListTile<bool>(
        value: value,
        title: TextWidget(text: title, fontSize: kH2),
        dense: true,
        groupValue: ProfileController.to.homecareRadioValue!,
        contentPadding: EdgeInsets.all(0.0),
        onChanged: (value) {
          setState(() {
            ProfileController.to.homecareRadioValue = value;
          });
        });
  }

  Widget _dropdownOpen() {
    return DropdownButton<String>(
        value: ProfileController.to.openDropdownValue,
        isExpanded: true,
        items: ProfileController.to.openDropdownItems.map((String item) {
          return DropdownMenuItem<String>(
            child: TextWidget(
              text: item,
              fontSize: kH2,
              fontColor: kOrange,
            ),
            value: item,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            ProfileController.to.openDropdownValue = value.toString();
          });
        });
  }

  Widget _dropdownPayment() {
    return DropdownButton<String>(
        value: ProfileController.to.paymentDropdownValue,
        isExpanded: true,
        items: ProfileController.to.paymentDropdownItems.map((String item) {
          return DropdownMenuItem<String>(
            child: TextWidget(
              text: item,
              fontSize: kH2,
              fontColor: kOrange,
            ),
            value: item,
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            ProfileController.to.paymentDropdownValue = value.toString();
          });
        });
  }
}
