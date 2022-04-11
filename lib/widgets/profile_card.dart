import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.profileName,
    required this.profileCourse,
    required this.profilePeriod,
    required this.cardAction,
  }) : super(key: key);

  final String profileName;
  final String profileCourse;
  final String profilePeriod;
  final Function() cardAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: cardAction,
          child: Container(
            decoration: const BoxDecoration(
              color: HelpTheme.helpDarkGreyShadow,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 80,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: _VideoDescription(
                      profileName: profileName,
                      profileCourse: profileCourse,
                      profilePeriod: profilePeriod,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        )
      ],
    );
  }
}

class _VideoDescription extends StatelessWidget {
  const _VideoDescription({
    Key? key,
    required this.profileName,
    required this.profileCourse,
    required this.profilePeriod,
  }) : super(key: key);

  final String profileName;
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
