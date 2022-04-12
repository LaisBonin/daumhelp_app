import 'package:flutter/material.dart';

class SubjectListTile extends StatelessWidget {
  final String subjectName;
  final Icon subjectIcon;
  final Function() subjectAction;

  const SubjectListTile(
      {Key? key,
      required this.subjectName,
      required this.subjectIcon,
      required this.subjectAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).hoverColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: ListTile(
            contentPadding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
            onTap: subjectAction,
            title: Text(
              subjectName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: subjectIcon,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            tileColor: Theme.of(context).hoverColor,
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
