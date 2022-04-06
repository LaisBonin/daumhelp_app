import 'package:flutter/material.dart';

class SubjectListTile extends StatelessWidget {
  final String subjectName;
  final Icon subjectIcon;
  final Function subjectAction;

  const SubjectListTile(
      {Key? key,
      required this.subjectName,
      required this.subjectIcon,
      required this.subjectAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10),
      onTap: () {},
      title: Text(
        subjectName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: subjectIcon,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Theme.of(context).hoverColor,
    );
  }
}
