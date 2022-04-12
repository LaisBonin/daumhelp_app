import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final Function action;
  final String errorText;
  final bool obscure;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.action,
    required this.errorText,
    required this.obscure,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          TextField(
            onChanged: widget.onChanged,
            obscureText: showPassword == false ? widget.obscure : false,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Theme.of(context).backgroundColor),
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).canvasColor,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              hintText: widget.hint,
              hintStyle: const TextStyle(color: HelpTheme.helpDarkGrey),
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
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: HelpTheme.helpYellow, width: 3.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
