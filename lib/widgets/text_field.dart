import 'package:flutter/material.dart';
// import 'package:daumhelp_app/widgets/theme_data.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final Function action;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.hint,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 309,
      height: 60,
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:const OutlineInputBorder(), labelText: label, hintText: hint
            ),
      ),
    );
  }
}
