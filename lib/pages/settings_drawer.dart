import 'package:daumhelp_app/pages/login_page_stl.dart';
import 'package:daumhelp_app/pages/my_applications_page.dart';
import 'package:daumhelp_app/pages/full_registration_page.dart';
import 'package:daumhelp_app/widgets/button_drawer.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:flutter/material.dart';
import '../widgets/exit_dialog.dart';

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(
                    width: 3, color: Theme.of(context).primaryColor))),
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
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const FullRegistrationPageStl()));
                },
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
                  action: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyApplicationsPage(),
                        ));
                  }),
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
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ExitDialog(
                            dialogTitle: "Deseja realmente sair?",
                            leftButtonAction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPageStl(),
                                ),
                              );
                            },
                            leftButtonTitle: "Sair",
                            rightButtonAction: () {
                              Navigator.of(context).pop();
                            },
                            rightButtonTitle: "Voltar",
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
