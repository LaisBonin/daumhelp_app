import 'package:daumhelp_app/pages/profile_page.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/profile_card.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/search_bar.dart';
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
  Future<QuerySnapshot<Map<String, dynamic>>> getUsersList() async {
    var collection = FirebaseFirestore.instance.collection("users");
    var users = await collection.get();
    return users;
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
              const SearchBar(),
              const SizedBox(
                height: 16,
              ),
              YellowButtonLarge(
                action: () {},
                title: 'Cabdidatar-se',
              ),
              FutureBuilder<QuerySnapshot>(
                future: getUsersList(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData && !snapshot.hasError) {
                    return Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor));
                  }
                  if (snapshot.hasError) {
                    return Container(
                      color: Colors.white,
                      child: const Text("QUEBROUUUU"),
                    );
                  } else {
                    final users = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: ((context, index) {
                        return ProfileCard(
                            profileName: users[index]["name"],
                            profileCourse: users[index]["curso"],
                            profilePeriod: users[index]["period"],
                            cardAction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    profileCourse: users[index]["curso"],
                                    profileLastName: users[index]["lastname"],
                                    profileName: users[index]["name"],
                                    profilePeriod: users[index]["period"],
                                    profileSkills: users[index]["skills"],
                                    profileContact: users[index]["contact"],
                                  ),
                                ),
                              );
                            });
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
