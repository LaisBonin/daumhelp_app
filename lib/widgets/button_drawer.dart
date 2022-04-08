import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String title;
  final Function action;
  final TextStyle? textStyle;

  const DrawerButton({
    Key? key,
    required this.title,
    required this.action,
    required this.textStyle,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 222,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).backgroundColor,
          elevation: 50,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          )),
        onPressed: () => action(),
        child: Center(
          child: Text(
            title,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
