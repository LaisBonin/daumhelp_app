import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Não pode abrir o url $url";
  }
}

contactDialog(
    BuildContext context, Function() contactAction, String contactNumber) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ReturnButton(),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: HelpTheme.helpYellow,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                width: 7, color: HelpTheme.helpYellow),
                          ),
                          child: const Icon(
                            Icons.whatsapp,
                            size: 24,
                            color: HelpTheme.helpButtonText,
                          )),
                      Text(
                        contactNumber,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  YellowButtonLarge(
                      title: "Mandar uma mensagem",
                      action: () async {
                        String url =
                            "https://api.whatsapp.com/send?phone=$contactNumber&text=Ol%C3%A1!%20Vi%20seu%20perfil%20no%20D%C3%A1%20um%20Help!%20e%20gostaria%20de%20uma%20monitoria,%20poderia%20me%20ajudar?";
                        await launchURL(url);
                      })
                ],
              ),
            ),
          ),
        );
      });
}
