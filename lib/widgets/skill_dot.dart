import 'package:flutter/material.dart';

class SkillDot extends StatelessWidget {
  const SkillDot({Key? key, required this.skillName}) : super(key: key);

  final String skillName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.brightness_1,
          size: 8,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          skillName,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
