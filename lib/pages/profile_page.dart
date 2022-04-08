import 'package:daumhelp_app/widgets/full_profile_card.dart';
import 'package:flutter/material.dart';
import '../widgets/theme_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
                profileName: "Eric",
                profileCourse: "Engª Mecânica",
                profilePeriod: "7º Período",
                cardAction: () {},
                profileLastName: "Francischett",
              )
            ],
          ),
        ),
      ),
    );
  }
}
