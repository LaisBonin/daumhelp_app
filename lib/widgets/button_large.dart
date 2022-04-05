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
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: ElevatedButton(
        style: HelpTheme.yellowButtonLarge(),
        onPressed: () => action(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, color: HelpTheme.helpButtonText),
            )
          ],
        ),
      ),
    );
  }
}
