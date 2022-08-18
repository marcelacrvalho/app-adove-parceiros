import 'package:app_adove/app/data/models/job.dart';
import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/job/controllers/job.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerJobWidget extends StatelessWidget {
  final Job currentJob;

  ContainerJobWidget(this.currentJob);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: currentJob.job.toString(),
      child: GestureDetector(
        onTap: () => JobController.to.toUpdateJobView(currentJob),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
          child: Container(
            width: double.infinity,
            height: Get.mediaQuery.size.height * 0.28,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: appThemeData.primaryColor.withOpacity(0.3),
              border: Border.all(
                      color: appThemeData.primaryColor,
                      width: 3.0,
                    ),
            ),
            child: Column(
              children: [
                TextWidget(
                    text: currentJob.job.toString(),
                    fontSize: kH2,
                    fontFamily: 'Made',
                    fontColor: kOrange,
                  ),
                Container(
                    width: double.infinity,
                    height: Get.mediaQuery.size.height * 0.14,
                    padding: EdgeInsets.all(8.0),
                    child: TextWidget(
                      text: currentJob.description.toString(),
                      fontSize: kH2,
                      isCenter: true,
                    ),
                  ),
                Divider(
                  color: appThemeData.primaryColor,
                  endIndent: 4.0,
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: TextWidget(
                      text: 'R\$ ${currentJob.price}',
                      fontSize: kH2,
                      fontFamily: 'Made',
                      fontColor: appThemeData.primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
