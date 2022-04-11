import 'package:daumhelp_app/pages/login_page.dart';
import 'package:daumhelp_app/widgets/button_dialogbox.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:daumhelp_app/widgets/return_button.dart';

contactBox(BuildContext context) {
  // exibe o diálogo
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            height: 119,
            width: 337,
            child: Column(
              children: [
                Row(
                  children: const [ReturnButton()],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 32.0, top: 0.0, right: 16.0, bottom: 0.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: HelpTheme.helpYellow,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 7, color: HelpTheme.helpYellow),
                          ),
                          child: const Icon(
                            Icons.whatsapp,
                            size: 24,
                            color: HelpTheme.helpButtonText,
                          )),
                    ),
                    Text(
                      "(41) 99999-9999",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
