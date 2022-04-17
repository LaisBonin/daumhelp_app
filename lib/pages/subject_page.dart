import 'package:daumhelp_app/pages/onboarding_page.dart';
import 'package:daumhelp_app/pages/profile_page.dart';
import 'package:daumhelp_app/models/user.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/profile_card.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/inform_dialog.dart';
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
  
  Future<List<UserModel>> getUsersList() async {
    var collection = FirebaseFirestore.instance.collection("users");
    final query = await collection.get();
    final userList =
        query.docs.map((e) => UserModel().fromMap(e.data())).toList();
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
          child: SingleChildScrollView(
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
                const SizedBox(
                  height: 16,
                ),
                YellowButtonLarge(
                  action: () async {
                    final userCredential = FirebaseAuth.instance.currentUser;
                    final infoCurrentUser = await FirebaseFirestore.instance
                        .collection("users")
                        .doc(userCredential!.uid)
                        .get();
                    if (infoCurrentUser["name"] == "") {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return InformDialog(
                                dialogTitle:
                                    "Você ainda não completou seu registro, complete antes de se candidatar",
                                buttonTitle: "Completar",
                                buttonAction: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const OnBoarding(),
                                      ));
                                });
                          });
                    } else {
                      if (infoCurrentUser["applies"]
                          .toString()
                          .contains(widget.selectedSubjectName)) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return InformDialog(
                                  dialogTitle:
                                      "Você já se candidatou para esta matéria",
                                  buttonTitle: "Voltar",
                                  buttonAction: () {
                                    Navigator.pop(context);
                                  });
                            });
                      } else {
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(userCredential.uid)
                            .update({
                          'applies': FieldValue.arrayUnion(
                              [widget.selectedSubjectName])
                        }).then((value) {
                          setState(() {});
                        });
                        showDialog(
                            context: context,
                            builder: (context) {
                              return InformDialog(
                                  dialogTitle: "Candidatura feita com sucesso!",
                                  buttonTitle: "Voltar",
                                  buttonAction: () {
                                    Navigator.pop(context);
                                  });
                            });
                      }
                    }
                  },
                  title: 'Candidatar-se',
                ),
                FutureBuilder<List<UserModel>>(
                  future: getUsersList(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {}
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
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          if (snapshot.data![index].applies!
                              .contains(widget.selectedSubjectName)) {
                            return ProfileCard(
                                profileName: snapshot.data![index].name!,
                                profileCourse: snapshot.data![index].course!,
                                profilePeriod: snapshot.data![index].period!,
                                cardAction: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(
                                        user: snapshot.data![index],
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
      ),
    );
  }
}
