import 'dart:ui';

import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/home/controllers/home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

class PublicationsDesignHomeWidget extends StatelessWidget {
  final currentPublication;

  PublicationsDesignHomeWidget(this.currentPublication);

  static final customCacheManager = CacheManager(
    Config(
      'customCacheKey',
      maxNrOfCacheObjects: 100,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
      child: GestureDetector(
        onTap: () => HomeController.to.toPublicationView(currentPublication),
        child: Stack(
          children: [
            SizedBox(
              height: Get.mediaQuery.size.height * 0.25,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: currentPublication.image.toString(),
                key: UniqueKey(),
                cacheManager: customCacheManager,
                fit: BoxFit.cover,
                height: Get.mediaQuery.size.height * 0.2,
                width: double.infinity,
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  width: Get.width * 0.25,
                  child: Opacity(
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
            ),
            Positioned(
              top: Get.mediaQuery.size.height * 0.16,
              left: Get.mediaQuery.size.width * 0.032,
              right: Get.mediaQuery.size.width * 0.032,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: Container(
                    height: Get.mediaQuery.size.height * 0.08,
                    width: Get.mediaQuery.size.width,
                    color: Colors.white30,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                          text: currentPublication.title.toString(),
                          fontSize: kH2 + 1,
                          isCenter: true,
                          fontColor: Get.theme.scaffoldBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
