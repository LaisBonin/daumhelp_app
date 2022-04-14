import 'package:daumhelp_app/pages/login_page_stl.dart';
import 'package:daumhelp_app/widgets/button_dialogbox.dart';
import 'package:flutter/material.dart';

exitDialog(BuildContext context, String leftButtonTitle, String rightButtonTitle) {
  // exibe o diálogo
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            height: 220,
            width: 337,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Você realmente deseja sair?",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 56,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        DialogButton(
                            title: leftButtonTitle,
                            color: Theme.of(context).errorColor,
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color: Theme.of(context).canvasColor),
                            action: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginPageStl())))
                      ],
                    ),
                    const SizedBox(
                      width: 46,
                    ),
                    Column(
                      children: [
                        DialogButton(
                            title: rightButtonTitle,
                            color: Theme.of(context).primaryColor,
                            textStyle: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    color: Theme.of(context).shadowColor),
                            action: () {
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
