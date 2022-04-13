import 'package:daumhelp_app/pages/settings_drawer.dart';
import 'package:daumhelp_app/pages/subject_page.dart';
import 'package:flutter/material.dart';
import '../models/subject_icon_selector.dart';
import '../widgets/subject_listtile.dart';
import '../widgets/theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectListPage extends StatefulWidget {
  const SubjectListPage({Key? key}) : super(key: key);

  @override
  State<SubjectListPage> createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Future<QuerySnapshot<Map<String, dynamic>>> getSubjectList() async {
    var collection = FirebaseFirestore.instance.collection("subjects");
    var subjects = await collection.get();
    return subjects;
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
        key: _scaffoldKey,
        endDrawer: const SettingsDrawer(),
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
                  Text(
                    "Matérias",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                    icon: const Icon(
                      Icons.settings,
                      size: 32,
                    ),
                  )
                ],
              ),
              FutureBuilder<QuerySnapshot>(
                future: getSubjectList(),
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
                    final subjects = snapshot.data!.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subjects.length,
                      itemBuilder: ((context, index) {
                        return SubjectListTile(
                            subjectName: subjects[index]["name"],
                            subjectIcon: Icon(
                              handleIconFromFirebase(
                                subjects[index]["icon"],
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            subjectAction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SubjectPage(
                                    selectedSubjectName: subjects[index]
                                        ["name"],
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
