import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewPasswordStl extends StatelessWidget {
  NewPasswordStl({Key? key}) : super(key: key);

  String newPassword = "";
  String confirmNewPassword = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [HelpTheme.helpDarkGrey, HelpTheme.helpButtonText])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const ReturnButton(),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Nova senha",
                        textAlign: TextAlign.justify,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Theme.of(context).canvasColor),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: HelpTheme.helpDarkGreyShadow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // CustomTextField(
                          //     hint: "Senha atual",
                          //     action: () {},
                          //     errorText: "Campo Obrigatório!",
                          //     showErrorText: false,
                          //     obscure: false),
                          // const SizedBox(height: 14),
                          CustomTextField(
                              keyboardType: TextInputType.name,
                              onChanged: (text) {
                                newPassword = text;
                              },
                              hint: "Nova senha",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              showErrorText: false,
                              obscure: true),
                          const SizedBox(height: 14),
                          CustomTextField(
                              keyboardType: TextInputType.name,
                              onChanged: (text) {
                                confirmNewPassword = text;
                              },
                              hint: "Confirme a senha",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              showErrorText: false,
                              obscure: true),
                          const SizedBox(
                            height: 50,
                          ),
                          YellowButtonLarge(title: "Atualizar", action: () {
                            if (newPassword == "" || confirmNewPassword == "") {
                              showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            "PREENCHA TODOS OS CAMPOS"),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, "OK"),
                                            child: const Text("OK"),
                                          )
                                        ],
                                      );
                                    });
                            } else {
                              if (newPassword == confirmNewPassword) {
                              FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
                              showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            "SENHA ALTERADA"),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, "OK"),
                                            child: const Text("OK"),
                                          )
                                        ],
                                      );
                                    });
                            } else {
                              showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            "SENHAS NÃO SÃO IGUAIS"),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context, "OK"),
                                            child: const Text("OK"),
                                          )
                                        ],
                                      );
                                    });
                            }                              
                            }
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
