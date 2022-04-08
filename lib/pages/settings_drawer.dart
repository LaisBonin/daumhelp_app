import 'package:daumhelp_app/widgets/button_drawer.dart';
import 'package:daumhelp_app/widgets/dialog_box.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:flutter/material.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: Container(
        decoration:
            BoxDecoration(
              border: Border(left: BorderSide(width: 3, color: Theme.of(context).primaryColor))
            ),
        child: ListView(
          children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Column(
                  children: const [ReturnButton()],
                ),
                Column(
                  children: [
                    Text(
                      "Ajustes",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Theme.of(context).canvasColor),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
              child: DrawerButton(
                title: "Meu Perfil",
                action: () {},
                textStyle: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Theme.of(context).canvasColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
              child: DrawerButton(
                  title: "Minhas Candidaturas",
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Theme.of(context).canvasColor),
                  action: () {}),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
              child: DrawerButton(
                  title: "Sair",
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Theme.of(context).errorColor),
                  action: () {
                    exitDialog(context);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
