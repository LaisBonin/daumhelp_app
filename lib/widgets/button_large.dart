import 'package:flutter/material.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';

class YellowButtonLarge extends StatelessWidget {
  final String title;
  final Function action;

  const YellowButtonLarge({
    Key? key,
    required this.title,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).primaryColor,
        fixedSize: const Size(309, 60),
        elevation: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        )),
      onPressed: () => action(),
      child: Center(
        child: Text(
          title,
          style:
              const TextStyle(fontSize: 20, color: HelpTheme.helpButtonText),
        ),
      ),
    );
  }
}
