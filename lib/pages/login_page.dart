
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
//Valores para preenche formulário...

  bool isLogin = true;
  bool loading = false;
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        // Lógica do botão "continuar" vai aqui...
      }
    });
  }

  login() async {
    setState(() => loading = true);
    // Lógica de autenticação vai aqui...
    // try {
    //   await context.read<AuthService>().login(email.text, senha.text);
    // } on AuthException catch (e) {
    //   setState(() => loading = false);
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text(e.message)));
    // }
  }

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
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
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
                              hint: "Email",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              hint: "Senha",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: true),
                          const SizedBox(
                            height: 14,
                          ),
                          YellowButtonLarge(title: "Continuar", action: () {}),
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
                            onTap: () => setFormAction(!isLogin),
                            child: Text(
                              "Increva-se",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Theme.of(context).primaryColor),
                            ),
                          ),
                          InkWell(
                            onTap: () => setFormAction(!isLogin),
                            child: Text(
                              "Esqueceu sua senha?",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: Theme.of(context).primaryColor),
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
