import 'package:daumhelp_app/pages/profile_page.dart';
import 'package:daumhelp_app/user.dart';
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

  List<User> userList = [];

  Future<List<User>> getUsersList() async {
    var collection = FirebaseFirestore.instance.collection("users");
    await collection.get().then((QuerySnapshot queryList) {
      for (var doc in queryList.docs) {
        final User user = User(
            applies: doc["applies"],
            contact: doc["contact"],
            course: doc["curso"],
            email: doc["email"],
            id: doc["id"],
            lastname: doc["lastname"],
            name: doc["name"],
            period: doc["period"],
            skills: doc["skills"]);
        userList.add(user);
      }
    });
    return [];
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
              FutureBuilder<List>(
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
                        if (userList[index].applies.contains(widget.selectedSubjectName)) {
                        return ProfileCard(
                            profileName: userList[index].name,
                            profileCourse: userList[index].course,
                            profilePeriod: userList[index].period,
                            cardAction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(
                                    profileCourse: userList[index].course,
                                    profileLastName: userList[index].lastname,
                                    profileName: userList[index].name,
                                    profilePeriod: userList[index].period,
                                    profileSkills: userList[index].skills,
                                    profileContact: userList[index].contact,
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
