import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daumhelp_app/pages/subject_list_page.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  bool _emailValidator(String email) {
    return EmailValidator.validate(email);
  }

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";
    String confirmpassword = "";

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
                              },
                              hint: "Email",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              showErrorText: false,
                              obscure: false),
                             
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              onChanged: (text) {
                                password = text;
                              },
                              hint: "Senha",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              showErrorText: false,
                              obscure: true),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              onChanged: (text) {
                                confirmpassword = text;
                              },
                              hint: "Confirme a senha",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              showErrorText: false,
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
                              final isValid = _emailValidator(email);
                              if (email == "" ||
                                  password == "" ||
                                  confirmpassword == "") {
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
                              } else if (password == confirmpassword) {
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
                                        "applies" : [],
                                        "skills" : []
                                      },
                                    );
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("REGISTROU"),
                                            actions: [
                                              TextButton(
                                                  onPressed: () =>
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const SubjectListPage(),
                                                          )),
                                                  child: const Text("OK"))
                                            ],
                                          );
                                        });
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("SENHA FRACA"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, "OK"),
                                                  child: const Text("OK"),
                                                )
                                              ],
                                            );
                                          });
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title:
                                                  const Text("EMAIL JÁ EM USO"),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, "OK"),
                                                  child: const Text("OK"),
                                                )
                                              ],
                                            );
                                          });
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title:
                                              const Text("EMAIL NÃO É VALIDO"),
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
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title:
                                            const Text("SENHAS NÃO CONFEREM"),
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
