import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/subject_listtile.dart';
import 'package:flutter/material.dart';
import '../widgets/theme_data.dart';

class MyApplicationsPage extends StatelessWidget {
  const MyApplicationsPage({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const ReturnButton(),
                      Text(
                        "Candidaturas",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return SubjectListTile(
                      subjectName: "teste",
                      subjectIcon: const Icon(Icons.add),
                      subjectAction: () {});
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
