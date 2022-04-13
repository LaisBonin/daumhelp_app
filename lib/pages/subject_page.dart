import 'package:daumhelp_app/pages/onboarding_page.dart';
import 'package:daumhelp_app/pages/profile_page.dart';
import 'package:daumhelp_app/models/user.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/profile_card.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:flutter/material.dart';
import '../widgets/theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectPage extends StatefulWidget {
  final String selectedSubjectName;
  const SubjectPage({Key? key, required this.selectedSubjectName})
      : super(key: key);

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  List<User> userList = [];

  Future<List<User>> getUsersList() async {
    var collection = FirebaseFirestore.instance.collection("users");
    await collection
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> queryList) {
      for (var doc in queryList.docs) {
        final user = User().fromMap(doc.data());
        userList.add(user);
      }
    });
    return userList;
  }

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
                children: [
                  const ReturnButton(),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.selectedSubjectName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              // const SearchBar(),
              const SizedBox(
                height: 16,
              ),
              YellowButtonLarge(
                action: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OnBoarding()));
                },
                title: 'Candidatar-se',
              ),
              FutureBuilder<List<User>>(
                future: getUsersList(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData && !snapshot.hasError) {
                    return Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor));
                  }
                  if (snapshot.hasError) {
                    return Container(
                      color: Colors.white,
                      child: const Text("QUEBROUUUU"),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: userList.length,
                      itemBuilder: ((context, index) {
                        if (userList[index]
                            .applies!
                            .contains(widget.selectedSubjectName)) {
                          return ProfileCard(
                              profileName: userList[index].name!,
                              profileCourse: userList[index].course!,
                              profilePeriod: userList[index].period!,
                              cardAction: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                      user: userList[index],
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const SizedBox();
                        }
                      }),
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
