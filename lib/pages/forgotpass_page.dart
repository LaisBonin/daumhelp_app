import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
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
                              hint: "Email",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          YellowButtonLarge(
                              title: "Enviar email de recuperação",
                              action: () {}),
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
