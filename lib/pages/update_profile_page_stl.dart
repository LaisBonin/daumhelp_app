 import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class UpdateProfilePageStl extends StatelessWidget {
  const UpdateProfilePageStl({Key? key}) : super(key: key);

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
                              showErrorText: false,
                              obscure: false),
                          const SizedBox(height: 14),
                          CustomTextField(
                              hint: "Ultimo Nome",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              showErrorText: false,
                              obscure: false),
                          const SizedBox(height: 14),
                          CustomTextField(
                              hint: "Curso",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              showErrorText: false,
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              hint: "Periodo",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              showErrorText: false,
                              obscure: false),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                              hint: "Número do WhatsApp",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              showErrorText: false,
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
                                    showErrorText: false,
                                    obscure: false),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: HelpTheme.helpYellow,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    width: 60,
                                    height: 60,
                                    // color: Theme.of(context).primaryColor,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.add,
                                          color: HelpTheme.helpButtonText,
                                          size: 32,
                                        )),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          YellowButtonLarge(title: "Continuar", action: () {}),
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
