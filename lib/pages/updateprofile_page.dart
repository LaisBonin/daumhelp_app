import 'package:daumhelp_app/pages/settings_drawer.dart';
import 'package:daumhelp_app/widgets/add_button.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:daumhelp_app/pages/settings_drawer.dart';

class UpDatePage extends StatefulWidget {
  const UpDatePage({Key? key}) : super(key: key);

  @override
  _UpDatePage createState() => _UpDatePage();
}

class _UpDatePage extends State<UpDatePage> {
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
                        "Sobre você",
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
                          CustomTextField(
                              hint: "Primeiro nome",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(height: 14),
                          CustomTextField(
                              hint: "Ultimo Nome",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(height: 14),
                          CustomTextField(
                              hint: "Curso",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              hint: "Periodo",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              hint: "Número do WhatsApp",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: CustomTextField(
                                    hint: "Habilidades",
                                    action: () {},
                                    errorText: "Campo Obrigatório!",
                                    obscure: false),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    color: Theme.of(context).primaryColor,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.add, size: 32,)),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          YellowButtonLarge(title: "Atualizar", action: () {}),
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

        // ),
        // ),
      ),
    );
  }
}
