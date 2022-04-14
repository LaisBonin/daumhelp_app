import 'package:daumhelp_app/widgets/button_dialogbox.dart';
import 'package:flutter/material.dart';

class InformDialog extends StatelessWidget {
  final String dialogTitle;
  final String buttonTitle;
  final Function() buttonAction;
  const InformDialog({ Key? key, required this.dialogTitle, required this.buttonTitle, required this.buttonAction }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    dialogTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DialogButton(
                          title: buttonTitle,
                          color: Theme.of(context).primaryColor,
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: Theme.of(context).shadowColor),
                          action: buttonAction),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
  }
}
