import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';

import '../widgets/inform_dialog.dart';

class ForgotPasswordPageStl extends StatefulWidget {
  const ForgotPasswordPageStl({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPageStl> createState() => _ForgotPasswordPageStlState();
}

class _ForgotPasswordPageStlState extends State<ForgotPasswordPageStl> {
  TextEditingController emailController = TextEditingController();
  bool emailError = false;
  String emailErrorText = "Campo obrigatório!";
  String email = "";

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
                        "Esqueceu\n" "sua senha?",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text:
                                      "Por favor insira um endereço de email,\n"
                                      "que enviaremos um",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          color: Theme.of(context).canvasColor),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          " link para redefinir\n" "sua senha",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 22),
                          CustomTextField(
                              controller: emailController,
                              onChanged: (text) {
                                email = text;
                                setState(() {
                                  emailError = false;
                                });
                              },
                              hint: "Email",
                              action: () {},
                              errorText: emailErrorText,
                              showErrorText: emailError,
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          YellowButtonLarge(
                              title: "Enviar email de recuperação",
                              action: () async {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email);
                                if (email.isEmpty || email == "") {
                                  emailError = true;
                                  emailErrorText = "Campo obrigatório!";
                                  setState(() {});
                                } else if (emailValid == false) {
                                  emailError = true;
                                  emailErrorText = "Digite um email válido!";
                                  setState(() {});
                                } else {
                                  FirebaseAuth.instance
                                      .sendPasswordResetEmail(email: email);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return InformDialog(
                                            dialogTitle:
                                                "Email de recuperação enviado",
                                            buttonTitle: "Voltar",
                                            buttonAction: () {
                                              Navigator.pop(context);
                                            });
                                      }).then((value) => Navigator.pop(context));
                                }
                              }),
                          const SizedBox(
                            height: 20,
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

        // ),
        // ),
      ),
    );
  }
}
