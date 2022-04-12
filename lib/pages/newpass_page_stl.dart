
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:flutter/material.dart';

class NewPasswordStl extends StatelessWidget {
  const NewPasswordStl({ Key? key }) : super(key: key);

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
                        "Nova senha",
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
                              hint: "Senha atual",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(height: 14),
                          CustomTextField(
                              hint: "Nova senha",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(height: 14),
                          CustomTextField(
                              hint: "Confirme a senha",
                              action: () {},
                              errorText: "Campo Obrigatório!",
                              obscure: false),
                          const SizedBox(
                            height: 50,
                          ),
                          YellowButtonLarge(
                              title: "Atualizar",
                              action: () {}),
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