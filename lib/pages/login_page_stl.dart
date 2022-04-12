import 'package:daumhelp_app/pages/forgot_password_page_stl.dart';
import 'package:daumhelp_app/pages/signup_page.dart';
import 'package:daumhelp_app/pages/subject_list_page.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageStl extends StatelessWidget {
  const LoginPageStl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [HelpTheme.helpDarkGrey, HelpTheme.helpButtonText])),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Bem-vindo!",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: HelpTheme.helpWhiteIce,
                      fontSize: 40,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
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
                              obscure: true),
                          const SizedBox(
                            height: 14,
                          ),
                          YellowButtonLarge(
                              title: "Continuar",
                              action: () async {
                                try {
                                  UserCredential userCredential =
                                      await FirebaseAuth
                                          .instance
                                          .signInWithEmailAndPassword(
                                              email: email, password: password);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("LOGADO"),
                                          actions: [
                                            TextButton(
                                                onPressed: () => Navigator.push(
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
                                  if (e.code == 'user-not-found') {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text(
                                                "NÃO EXISTE UMA CONTA COM ESSE EMAIL"),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, "OK"),
                                                child: const Text("OK"),
                                              )
                                            ],
                                          );
                                        });
                                  } else if (e.code == 'wrong-password') {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("SENHA"),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, "OK"),
                                                child: const Text("OK"),
                                              )
                                            ],
                                          );
                                        });
                                  }
                                }
                              }),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Ainda não possui uma conta?",
                            style: TextStyle(
                              color: HelpTheme.helpWhiteIce,
                              fontSize: 16,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage())),
                            child: Text(
                              "Increva-se",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPageStl())),
                            child: Text(
                              "Esqueceu sua senha?",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
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
