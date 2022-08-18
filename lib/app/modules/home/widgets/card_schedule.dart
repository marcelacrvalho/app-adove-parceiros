import 'package:app_adove/app/data/models/event.dart';
import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/auth/controllers/auth.dart';
import 'package:app_adove/app/modules/home/controllers/schedule.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardSchedule extends StatelessWidget {
  final Event event;

  CardSchedule(this.event);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Divider(),
            _alignDate(),
            Divider(),
            Column(
              children: [_cardInfo()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardInfo() {
    return Tooltip(
      message: '${event.job!.job}, as ${event.hour!.hour}',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _containerHour(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              padding: EdgeInsets.all(16.0),
              color: Colors.grey.shade300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: event.user!.name.toString(),
                    fontSize: kH2,
                    fontColor: kOrange,
                  ),
                  TextWidget(
                    text: event.job!.job.toString(),
                    fontSize: kH3,
                    fontColor: Colors.grey,
                  ),
                  Divider(),
                  Visibility(
                    visible:
                        AuthController.to.currentStore.value.homecare == true
                            ? true
                            : false,
                    child: TextWidget(
                      text: '${event.user!.street},',
                      fontSize: kH3,
                      fontColor: appThemeData.primaryColor,
                    ),
                  ),
                  Visibility(
                    visible:
                        AuthController.to.currentStore.value.homecare == true
                            ? false
                            : true,
                    child: Divider(height: Get.mediaQuery.size.height * 0.03),
                  ),
                  Visibility(
                    visible:
                        AuthController.to.currentStore.value.homecare == true
                            ? true
                            : false,
                    child: TextWidget(
                      text:
                          '${event.user!.neighborhood}, ${event.user!.number}',
                      fontSize: kH3,
                      fontColor: appThemeData.primaryColor,
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Divider(),
                  _price(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _alignDate() {
    return Align(
      alignment: Alignment.topLeft,
      child: TextWidget(
        text: ScheduleController.to.dateString(event.date.toString()),
        fontSize: kH2,
        fontColor: Colors.grey,
      ),
    );
  }

  Widget _containerHour() {
    return Container(
      padding: EdgeInsets.all(16.00),
      width: Get.mediaQuery.size.width * 0.25,
      child: TextWidget(
        text: event.hour!.hour.toString(),
        fontSize: kH2,
      ),
    );
  }

  Widget _price() {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextWidget(
        text: 'R\$ ${event.job!.price}',
        fontSize: kH2,
        fontColor: appThemeData.primaryColor,
        isBold: true,
      ),
    );
  }
}
