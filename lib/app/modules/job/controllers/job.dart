import 'package:app_adove/app/data/models/job.dart';
import 'package:app_adove/app/data/repositories/job.dart';
import 'package:app_adove/app/global/widgets/snackbar/snackbar.dart';
import 'package:app_adove/app/modules/auth/controllers/auth.dart';
import 'package:app_adove/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  static JobController get to => Get.find<JobController>();
  final repository = Get.find<JobRepository>();

  TextEditingController controllerJob = TextEditingController();
  TextEditingController controllerPrice = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  RxList<Job>? listJobs = <Job>[].obs;
  Rx<Job> currentJob = Job().obs;

  void newJob() async {
    if (controllerJob.text != '' && controllerDescription.text != '') {
      final response = await repository.newJob(
        controllerJob.text,
        controllerDescription.text,
        controllerPrice.text,
        AuthController.to.currentStore.value.id!,
      );
      if (response != null) {
        SnarckBarWidget.showSnack(
          'Tudo certo!',
          'Serviço adicionado com sucesso',
        );
        controllerJob.text = '';
        controllerDescription.text = '';
        controllerPrice.text = '';
      } else {
        SnarckBarWidget.showSnack(
          'Eita, meu sistema caiu',
          'Tente de novo, em alguns instantes',
        );
      }
    } else {
      SnarckBarWidget.showSnack(
        'Eita, deu ruim!',
        'Alguns campos não foram preenchidos',
      );
    }
  }

  Future updateJob() async {
    final response = await repository.editJob(
      currentJob.value.id!,
      controllerJob.text != '' && controllerJob.text != currentJob.value.job
          ? controllerJob.text
          : currentJob.value.job,
      controllerDescription.text != '' &&
              controllerDescription.text != currentJob.value.description
          ? controllerDescription.text
          : currentJob.value.description,
      controllerPrice.text != '' &&
              controllerPrice.text != currentJob.value.price
          ? controllerPrice.text
          : currentJob.value.price,
    );
    Get.offNamed(Routes.kJobList);
    if (response != null) {
      SnarckBarWidget.showSnack(
        'Tudo certo',
        'Sua alterações foram salvas com sucesso',
      );
    }
  }

  Future getJobs() async {
    final response =
        await repository.jobs(AuthController.to.currentStore.value.id!);
    listJobs?.value = response;
  }

  void deleteJob() async {
    await repository.deleteJob(currentJob.value.id!);
    Get.offNamed(Routes.kJobList);
    SnarckBarWidget.showSnack(
      'Serviço excluído',
      'Adicione um novo serviço quando quiser',
    );
  }

  void toUpdateJobView(Job job) {
    currentJob.value = job;
    Get.toNamed(Routes.kUpdateJob);
  }
}
