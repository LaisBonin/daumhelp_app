import 'package:daumhelp_app/pages/settings_drawer.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/dialog_box.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:daumhelp_app/pages/settings_drawer.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();
  late ScrollController _scrollController;
//Valores para preenche formulário...

  bool isLogin = true;
  bool loading = false;
  bool showPassword = false;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
    // setFormAction(true);
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
            controller: _scrollController,
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
                          CustomTextField(
                              hint: "Confirme a senha",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: true),
                          const SizedBox(
                            height: 22,
                          ),
                          Text(
                            "Ao clicar em 'Concordar e Continuar'",
                            style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context).canvasColor)
                            ),
                          
                          InkWell(
                            onTap: () => setFormAction(!isLogin),
                            child: Text(
                              "você concorda com os Termos de Serviço e Politica de Privacidade ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                          const SizedBox(
                            height: 55,
                          ),
                          YellowButtonLarge(title: "Concordar e Continuar", action: () {}),
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
