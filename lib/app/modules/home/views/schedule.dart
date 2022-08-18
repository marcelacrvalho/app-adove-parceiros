import 'package:app_adove/app/data/models/event.dart';
import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/home/controllers/schedule.dart';
import 'package:app_adove/app/modules/home/widgets/card_schedule.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData.primaryColor,
      body: SafeArea(
        bottom: false,
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Container(
          color: appThemeData.primaryColor,
          width: double.infinity,
          height: Get.mediaQuery.size.height * 0.1,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5.0,
                  offset: Offset(3, 1),
                ),
              ],
            ),
            child: _getXListEvents(),
          ),
        ),
      ],
    );
  }

  Widget _getXListEvents() {
    return GetX(
      init: ScheduleController(),
      autoRemove: true,
      initState: (_) => ScheduleController.to.events(),
      didUpdateWidget: (_, __) => ScheduleController.to.events(),
      builder: (_) => ScheduleController.to.listEvents!.isNotEmpty &&
              ScheduleController.to.listEvents != null
          ? _eventsList()
          : Center(
              child: TextWidget(
                text: 'Você não possui horários marcados :(',
                fontSize: kH2,
                fontColor: Colors.grey,
                isCenter: true,
              ),
            ),
    );
  }

  Widget _eventsList() {
    return ScheduleController.to.listEvents!.isNotEmpty &&
            ScheduleController.to.listEvents != null
        ? ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: ScheduleController.to.listEvents!.length,
            itemBuilder: (context, index) {
              return _cardInformationWithDismissible(
                  ScheduleController.to.listEvents![index]);
            })
        : Center(
            child: TextWidget(
              text: 'Você não possui horários marcados :(',
              fontSize: kH2,
              fontColor: Colors.grey,
              isCenter: true,
            ),
          );
  }

  Widget _cardInformationWithDismissible(Event event) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        ScheduleController.to.currentEvent.value = event;
        Get.snackbar(
          'Horário desmarcado',
          'Volte a marcar um novo horário quando quiser',
          margin: EdgeInsets.only(
            top: Get.mediaQuery.size.height * 0.03,
            left: 4.0,
            right: 4.0,
          ),
          borderRadius: 7.0,
        );
        ScheduleController.to.listEvents!.remove(event);
        ScheduleController.to.cancel();
      },
      confirmDismiss: (direction) {
        return Future.value(direction == DismissDirection.endToStart);
      },
      background: Container(
        color: appThemeData.scaffoldBackgroundColor,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextWidget(
              text: 'DESMARCAR',
              fontSize: kH3,
              isBold: true,
              fontColor: appThemeData.primaryColor,
            ),
          ),
        ),
      ),
      child: CardSchedule(event),
    );
  }
}
