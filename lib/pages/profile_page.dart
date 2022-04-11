import 'package:daumhelp_app/widgets/full_profile_card.dart';
import 'package:flutter/material.dart';
import '../widgets/theme_data.dart';

class ProfilePage extends StatelessWidget {
  final String profileName;
  final String profileCourse;
  final String profilePeriod;
  final String profileLastName;
  final String profileContact;
  final List<dynamic> profileSkills;

  const ProfilePage(
      {Key? key,
      required this.profileName,
      required this.profileCourse,
      required this.profilePeriod,
      required this.profileLastName,
      required this.profileSkills,
      required this.profileContact})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [HelpTheme.helpDarkGrey, HelpTheme.helpButtonText]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              FullProfileCard(
                profileName: profileName,
                profileCourse: profileCourse,
                profilePeriod: profilePeriod,
                cardAction: () {},
                profileLastName: profileLastName,
                profileSkills: profileSkills,
                profileContact: profileContact,
              )
            ],
          ),
        ),
      ),
    );
  }
}
