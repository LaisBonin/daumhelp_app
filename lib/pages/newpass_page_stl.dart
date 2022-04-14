import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewPasswordStl extends StatefulWidget {
  const NewPasswordStl({Key? key}) : super(key: key);

  @override
  State<NewPasswordStl> createState() => _NewPasswordStlState();
}

class _NewPasswordStlState extends State<NewPasswordStl> {

  String passNew = "";
  String passNewErrorText = "Senha Incorreta!";
  bool passNewError = false;

  String passNewConfirm = "";
  String passNewConfirmErrorText = "Senha Incorreta!";
  bool passNewConfirmError = false;

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
                              onChanged: (text) {
                                passNew = text;
                                setState(() {
                                  passNewError = false;
                                });
                              },
                              hint: "Nova Senha",
                              action: () {},
                              errorText: passNewErrorText,
                              showErrorText: passNewError,
                              obscure: true),
                          const SizedBox(height: 14),
                          CustomTextField(
                              onChanged: (text) {
                                passNewConfirm = text;
                                setState(() {
                                  passNewConfirmError = false;
                                });
                              },
                              hint: "Confirme a senha",
                              action: () {},
                              errorText: passNewConfirmErrorText,
                              showErrorText: passNewConfirmError,
                              obscure: true),
                          const SizedBox(
                            height: 50,
                          ),

                          YellowButtonLarge(
                              title: "Atualizar",
                              action: () {

                                if (passNew.isEmpty || passNew == "") {
                                  passNewError = true;
                                  passNewErrorText = "Campo obrigatório!";

                                  setState(() {});
                                }

                                if (passNewConfirm.isEmpty ||
                                    passNewConfirm == "") {
                                  passNewConfirmError = true;
                                  passNewConfirmErrorText =
                                      "Campo obrigatório!";
                                  setState(() {});
                                }
                                if (passNew != passNewConfirm) {
                                  passNewConfirmError = true;
                                  passNewConfirmErrorText =
                                      "Senhas não conferem!";
                                  setState(() {});
                                }

                              }),

                          YellowButtonLarge(title: "Atualizar", action: () {
                              if (passNew == passNewConfirm) {
                              FirebaseAuth.instance.currentUser!.updatePassword(passNew);
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
