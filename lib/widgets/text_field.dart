import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';
// import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final Function action;
  final String errorText;
  final bool obscure;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.action,
    required this.errorText,
    required this.obscure,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 309,
      height: 60,
      child: TextField(
        obscureText: showPassword == false ? widget.obscure : false,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).canvasColor,
          // errorText: errorText,
          border: const OutlineInputBorder(),
          hintText: widget.hint,
          suffixIcon: widget.obscure == true
              ? GestureDetector(
                  child: Icon(
                    showPassword == false
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: HelpTheme.helpYellow,
                  ),
                  onTap: () {
                    setState((() {
                      showPassword = !showPassword;
                    }));
                  },
                )
              : null,
          focusColor: HelpTheme.helpYellow,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: HelpTheme.helpYellow, width: 2.0),
          ),
        ),
      ),
    );
  }
}
