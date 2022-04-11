import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final String title;
  final Function action;

  const AddButton({
    Key? key,
    required this.title,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            elevation: 50,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )),
        onPressed: () => action(),
        child: Center(
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}
