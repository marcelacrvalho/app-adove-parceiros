import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageInitialWidget extends StatelessWidget {
  final String path;

  ImageInitialWidget({required this.path});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.mediaQuery.size.height * 0.9,
      child: Image.asset(path),
    );
  }
}
