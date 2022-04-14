import 'package:daumhelp_app/widgets/button_dialogbox.dart';
import 'package:flutter/material.dart';

class ExitDialog extends StatelessWidget {
  final String dialogTitle;
  final String leftButtonTitle;
  final String rightButtonTitle;
  final Function() leftButtonAction;
  final Function() rightButtonAction;
  const ExitDialog(
      {Key? key,
      required this.dialogTitle,
      required this.leftButtonTitle,
      required this.rightButtonTitle,
      required this.leftButtonAction,
      required this.rightButtonAction})
      : super(key: key);

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
                              ?.copyWith(color: Theme.of(context).canvasColor),
                          action: leftButtonAction)
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
                              ?.copyWith(color: Theme.of(context).shadowColor),
                          action: rightButtonAction)
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
