import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/subject_listtile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/theme_data.dart';

class MyApplicationsPage extends StatelessWidget {
  const MyApplicationsPage({
    Key? key,
  }) : super(key: key);

  Future<List> fetchAppliedSubjects() async {
    final collection = FirebaseFirestore.instance.collection("users");
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return <String>[];
    }
    final user = await collection.doc(currentUser.uid).get();
    final appliedSubjects = user["applies"];
    return appliedSubjects;
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
              FutureBuilder<List>(
                  future: fetchAppliedSubjects(),
                  builder: (context, snapshot) {
                    /// deu ruim
                    if (snapshot.hasError) {
                      const Text("Something went wrong");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (!snapshot.hasData) {
                      print(snapshot.error);
                      return const Text("error");
                    }

                    /// carregando
                    if (snapshot.data!.isEmpty && !snapshot.hasError) {
                      return const Text("Você ainda não tem candidaturas");
                    }

                    /// caminho feliz
                    if (snapshot.hasData && !snapshot.hasError) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return SubjectListTile(
                              subjectName: snapshot.data![index],
                              subjectIcon: const Icon(Icons.add),
                              subjectAction: () {});
                        }),
                      );
                    } else {
                      // sei la quye que deu
                      return const CircularProgressIndicator();
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
