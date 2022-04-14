import 'package:daumhelp_app/pages/forgot_password_page_stl.dart';
import 'package:daumhelp_app/pages/signup_page.dart';
import 'package:daumhelp_app/pages/subject_list_page.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageStl extends StatefulWidget {
  const LoginPageStl({Key? key}) : super(key: key);

  @override
  State<LoginPageStl> createState() => _LoginPageStlState();
}

class _LoginPageStlState extends State<LoginPageStl> {
  String email = "";
  String password = "";
  bool emailError = false;
  bool passError = false;
  String passErrorText = "Senha Incorreta!";
  String emailErrorText = "Campo obrigatório!";

  @override
  Widget build(BuildContext context) {
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
                          YellowButtonLarge(
                              title: "Continuar",
                              action: () async {
                                var isCredentialValid = true;
                                // print(emailError);
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email);
                                if (email.isEmpty || email == "") {
                                  emailError = true;
                                  isCredentialValid = false;
                                  emailErrorText = "Campo obrigatório!";
                                  setState(() {});
                                } else if (emailValid == false) {
                                  emailError = true;
                                  isCredentialValid = false;
                                  emailErrorText = "Digite um email válido!";
                                  setState(() {});
                                }

                                if (password.isEmpty || password == "") {
                                  passError = true;
                                  passErrorText = "Campo obrigatório!";
                                  isCredentialValid = false;
                                  setState(() {});
                                }

                                if (isCredentialValid) {
                                  try {
                                    UserCredential userCredential =
                                        await FirebaseAuth.instance
                                            .signInWithEmailAndPassword(
                                                email: email,
                                                password: password);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SubjectListPage(),
                                        ));
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      emailError = true;
                                      isCredentialValid = false;
                                      emailErrorText = "Usuário não existe!";
                                      setState(() {});
                                    } else if (e.code == 'wrong-password') {
                                      passError = true;
                                      passErrorText = "Senha Incorreta!";
                                      isCredentialValid = false;
                                      setState(() {});
                                    }
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
