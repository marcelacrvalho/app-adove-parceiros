import 'package:app_adove/app/global/helpers/constraints.dart';
import 'package:app_adove/app/global/widgets/text/text.dart';
import 'package:app_adove/app/modules/home/controllers/profile.dart';
import 'package:app_adove/app/modules/home/widgets/card_profile.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProfileView extends StatelessWidget {
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
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextWidget(
                text: 'Esse é o seu endereço de agendamento, cole-o na sua bio',
                fontSize: kH2,
                fontColor: Colors.grey,
              ),
            ),
            FutureBuilder(
                future: ProfileController.to.getAddressDynamicLink(),
                builder: (snapshot, data) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: SelectableText(
                      '${data.data}',
                      style: TextStyle(
                        fontSize: kH2,
                      ),
                    ),
                  );
                }),
            Divider(),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                children: [
                  CardIconProfileWidget(
                    text: 'Meus serviços',
                    icon: LineIcons.handshake,
                    onTap: ProfileController.to.toListJobsView,
                  ),
                  CardIconProfileWidget(
                    text: 'Meu endereço',
                    icon: LineIcons.home,
                    onTap: ProfileController.to.toAddressView,
                  ),
                  CardIconProfileWidget(
                    text: 'Meus dados',
                    icon: LineIcons.infoCircle,
                    onTap: ProfileController.to.toinfoView,
                  ),
                  CardIconProfileWidget(
                    text: 'Excluir conta',
                    icon: LineIcons.chevronCircleDown,
                    onTap: ProfileController.to.delete,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
