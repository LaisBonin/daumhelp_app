import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daumhelp_app/pages/subject_list_page.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/inform_dialog.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _emailValidator(String email) {
    return EmailValidator.validate(email);
  }

  bool emailError = false;
  bool passError = false;
  bool passConfirmError = false;
  String passErrorText = "Senha Incorreta!";
  String emailErrorText = "Campo obrigatório!";
  String passConfirmErrorText = "Senha Incorreta!";
  String email = "";
  String password = "";
  String confirmpassword = "";

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
              mainAxisAlignment: MainAxisAlignment.center,
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
                        "Inscreva-se",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HelpTheme.helpWhiteIce,
                          fontSize: 40,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
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
                          CustomTextField(
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
                          CustomTextField(
                              onChanged: (text) {
                                password = text;
                                setState(() {
                                  passError = false;
                                });
                              },
                              hint: "Senha",
                              action: () {},
                              errorText: passErrorText,
                              showErrorText: passError,
                              obscure: true),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              onChanged: (text) {
                                confirmpassword = text;
                                setState(() {
                                  passConfirmError = false;
                                });
                              },
                              hint: "Confirme a senha",
                              action: () {},
                              errorText: passConfirmErrorText,
                              showErrorText: passConfirmError,
                              obscure: true),
                          const SizedBox(
                            height: 22,
                          ),
                          Text("Ao clicar em 'Concordar e Continuar'",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context).canvasColor)),
                          Text(
                            "você concorda com os Termos de Serviço e Politica de Privacidade ",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          const SizedBox(
                            height: 55,
                          ),
                          YellowButtonLarge(
                            title: "Concordar e Continuar",
                            action: () async {
                              bool isValid = _emailValidator(email);

                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email);
                              if (email.isEmpty || email == "") {
                                emailError = true;
                                isValid = false;
                                emailErrorText = "Campo obrigatório!";
                                setState(() {});
                              } else if (emailValid == false) {
                                emailError = true;
                                isValid = false;
                                emailErrorText = "Digite um email válido!";
                                setState(() {});
                              }

                              if (password.isEmpty || password == "") {
                                passError = true;
                                passErrorText = "Campo obrigatório!";
                                isValid = false;
                                setState(() {});
                              }

                              if (confirmpassword.isEmpty ||
                                  confirmpassword == "") {
                                passConfirmError = true;
                                passConfirmErrorText = "Campo obrigatório!";
                                isValid = false;
                                setState(() {});
                              }

                              if (password == confirmpassword) {
                                if (isValid == true) {
                                  try {
                                    final userCredential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(userCredential.user!.uid)
                                        .set(
                                      {
                                        "id": userCredential.user!.uid,
                                        "email": email,
                                        "name": "",
                                        "lastname": "",
                                        "curso": "",
                                        "period": "",
                                        "contact": "",
                                        "applies": [],
                                        "skills": []
                                      },
                                    );
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return InformDialog(
                                              dialogTitle:
                                                  "Conta criada com sucesso",
                                              buttonTitle: "Voltar",
                                              buttonAction: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SubjectListPage()));
                                              });
                                        });
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      passError = true;
                                      passErrorText = "Senha fraca!";
                                      isValid = false;
                                      setState(() {});
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      emailError = true;
                                      isValid = false;
                                      emailErrorText = "Email já está em uso!";
                                      setState(() {});
                                    }
                                  }
                                }
                              } else {
                                passConfirmError = true;
                                passConfirmErrorText = "Senhas não conferem!";
                                isValid = false;
                                setState(() {});
                              }
                            },
                          ),
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
      ),
    );
  }
}
