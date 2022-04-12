import 'package:daumhelp_app/pages/newpass_page_stl.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullRegistrationPageStl extends StatelessWidget {
  const FullRegistrationPageStl({Key? key}) : super(key: key);

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
                        "Meu Perfil",
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
                              hint: "Nome completo",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
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
                              hint: "Email",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              hint: "Numero do WhatsApp",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NewPasswordStl())),
                            child: Text(
                              "Alterar senha",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context).canvasColor,
                                      decoration: TextDecoration.underline),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              hint: "Habilidades",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          // Text("Ao clicar em 'Concordar e Continuar'",
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .titleSmall
                          //         ?.copyWith(
                          //             color: Theme.of(context).canvasColor)),
                          // Text(
                          //   "você concorda com os Termos de Serviço e Politica de Privacidade ",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .titleSmall
                          //       ?.copyWith(
                          //           color: Theme.of(context).primaryColor),
                          // ),
                          const SizedBox(
                            height: 24,
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
