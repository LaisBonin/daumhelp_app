import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/contact_dialog.dart';
import 'package:daumhelp_app/widgets/skill_dot.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';

class FullProfileCard extends StatelessWidget {
  final String profileName;
  final String profileLastName;
  final String profileCourse;
  final String profilePeriod;
  final String profileContact;
  final List<dynamic> profileSkills;
  final Function() cardAction;

  const FullProfileCard({
    Key? key,
    required this.profileName,
    required this.profileLastName,
    required this.profileCourse,
    required this.profilePeriod,
    required this.cardAction,
    required this.profileSkills,
    required this.profileContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: cardAction,
      child: Container(
        decoration: const BoxDecoration(
          color: HelpTheme.helpDarkGreyShadow,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 80,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: _VideoDescription(
                      profileName: profileName,
                      profileLastName: profileLastName,
                      profileCourse: profileCourse,
                      profilePeriod: profilePeriod,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Habilidades:",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: profileSkills.length,
                  itemBuilder: ((context, index) {
                    return SkillDot(skillName: profileSkills[index]);
                  })),
              const SizedBox(
                height: 24,
              ),
              YellowButtonLarge(
                  title: "Contatar",
                  action: () {
                    contactDialog(context, () {}, profileContact);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.profileName,
    required this.profileLastName,
    required this.profileCourse,
    required this.profilePeriod,
  }) : super(key: key);

  final String profileName;
  final String profileLastName;
  final String profileCourse;
  final String profilePeriod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            profileName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            profileLastName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            profileCourse,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            profilePeriod + " Período",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
