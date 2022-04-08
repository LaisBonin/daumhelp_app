import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  final String title;
  final Function action;
  final Color color;
  final TextStyle? textStyle;


  const DialogButton({
    Key? key,
    required this.title,
    required this.action, 
    required this.color,
    required this.textStyle,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      width: 103,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          elevation: 50,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
        onPressed: () => action(),
        child: Center(
          child: Text(
            title,
            style: textStyle
          ),
        ),
      ),
    );
  }
}
