import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:flutter/material.dart';

class CourseView extends StatelessWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: TextWidget(
              text: 'Em breve os melhores cursos para você',
              fontSize: kH2,
              isCenter: true,
            ),
          ),
        ],
      ),
    );
  }
}
