import 'package:flutter/material.dart';
import '../widgets/subject_listtile.dart';
import '../widgets/theme_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubjectListPage extends StatefulWidget {
  const SubjectListPage({Key? key}) : super(key: key);

  @override
  State<SubjectListPage> createState() => _SubjectListPageState();
}

class _SubjectListPageState extends State<SubjectListPage> {
  List subjectList = [];

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
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Matérias",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        getSubjectList();
                      });
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
                    return const CircularProgressIndicator();
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
                            subjectIcon: Icon(handleIconFromFirebase(
                                subjects[index]["icon"]), color: Theme.of(context).primaryColor,),
                            subjectAction: () {});
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

  IconData handleIconFromFirebase(String iconName) {
    switch (iconName) {
      case "rulerCombined":
        return FontAwesomeIcons.rulerCombined;
      case "squareRootVariable":
        return FontAwesomeIcons.squareRootVariable;
      case "cube":
        return FontAwesomeIcons.cube;
      case "flask":
        return FontAwesomeIcons.flask;
      case "atom":
        return FontAwesomeIcons.atom;
      case "computer":
        return FontAwesomeIcons.computer;
      default:
        return FontAwesomeIcons.question;
    }
  }
}
