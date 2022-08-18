import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/header.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/home/controllers/home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

class PublicationView extends StatelessWidget {
  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      maxNrOfCacheObjects: 100,
    ),
  );

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderTextWidget(),
              CachedNetworkImage(
                imageUrl:
                    HomeController.to.currentPublication.value.image.toString(),
                key: UniqueKey(),
                cacheManager: customCacheManager,
                fit: BoxFit.cover,
                height: Get.mediaQuery.size.height * 0.4,
                width: double.infinity,
                placeholder: (context, url) =>  Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.25,
                  child:Opacity(
                    opacity: 0.5,
                    child: Image.asset(
                      'assets/images/loading.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => TextWidget(
                  text: 'Erro ao carregar a imagem',
                  fontSize: kH3,
                  fontColor: Colors.grey,
                ),
              ),
              Divider(),
              TextWidget(
                text:
                    HomeController.to.currentPublication.value.title.toString(),
                fontSize: kH2,
                isCenter: true,
                isBold: true,
                fontColor: kPurpleDark,
              ),
              Divider(),
              Align(
                alignment: Alignment.topLeft,
                child: TextWidget(
                  text: HomeController.to.currentPublication.value.text
                      .toString(),
                  fontSize: kH2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
