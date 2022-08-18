import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/buttons/flat.dart';
import 'package:app_adove/app/global/widgets/buttons/raised.dart';
import 'package:app_adove/app/global/widgets/text/form.dart';
import 'package:app_adove/app/global/widgets/text/header.dart';
import 'package:app_adove/app/modules/job/controllers/job.dart';
import 'package:app_adove/app/theme/app.dart';
import 'package:flutter/material.dart';

class JobUpdateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              HeaderTextWidget(),
              FormTextWidget(
                controller: JobController.to.controllerJob, 
                hinText: JobController.to.currentJob.value.job.toString(),
                ),
              Divider(),
              FormTextWidget(
                controller: JobController.to.controllerPrice, 
                hinText: JobController.to.currentJob.value.price.toString(),
              ),
              Divider(),
              FormTextWidget(
                controller: JobController.to.controllerDescription, 
                hinText: JobController.to.currentJob.value.description.toString(),
                showCountLenght: true,
                twoLines: true,
                ),
              RaisedButtonWidget(
                onTap: JobController.to.updateJob,
                height: kBigButton,
                buttonText: 'Salvar alteração',
                fontSize: kH2,
                buttonColor: appThemeData.primaryColor,
              ),
              Divider(),
              FlatButtonWidget(
                onTap: JobController.to.deleteJob,
                buttonText: 'Excluir',
                fontSize: kH2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
