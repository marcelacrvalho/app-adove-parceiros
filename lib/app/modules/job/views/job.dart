import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/header.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/job/widgets/container_job.dart';
import 'package:app_adove/app/modules/job/controllers/job.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class JobView extends StatelessWidget {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderTextWidget(),
            Expanded(
              child: FutureBuilder(
                  future: JobController.to.getJobs(),
                  builder: (context, snapshot) {
                    return _switchFutureBuilder(snapshot);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _switchFutureBuilder(AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Lottie.asset('assets/animations/animation-loading.json');
      case ConnectionState.active:
      case ConnectionState.done:
        return _listJobs();
    }
  }


  Widget _listJobs() {
    return Obx(
        () => ListView.builder(
            itemCount: JobController.to.listJobs!.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (JobController.to.listJobs!.isNotEmpty &&
                  JobController.to.listJobs != null) {
                return ContainerJobWidget(JobController.to.listJobs![index]);
              } else {
                return Center(
                  child: TextWidget(
                    text: 'Você ainda não cadastrou seus serviços :(',
                    fontSize: kH2,
                    fontColor: Colors.grey,
                  ),
                );
              }
            }),
    );
  }
}
