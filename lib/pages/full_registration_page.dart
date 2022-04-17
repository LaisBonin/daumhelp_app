import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daumhelp_app/pages/newpass_page_stl.dart';
import 'package:daumhelp_app/pages/subject_list_page.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/inform_dialog.dart';
import '../widgets/skill_dot.dart';

class FullRegistrationPageStl extends StatefulWidget {
  const FullRegistrationPageStl({Key? key}) : super(key: key);

  @override
  State<FullRegistrationPageStl> createState() =>
      _FullRegistrationPageStlState();
}

class _FullRegistrationPageStlState extends State<FullRegistrationPageStl> {
  Future<DocumentSnapshot<Map<String, dynamic>>> fetchCurrentUserData() async {
    final collection = FirebaseFirestore.instance.collection("users");
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return <String>[] as DocumentSnapshot<Map<String, dynamic>>;
    }
    final currentUserData = await collection.doc(currentUser.uid).get();
    return currentUserData;
  }

  DocumentSnapshot<Map<String, dynamic>>? currentUserInfo;

  String firstName = "";
  String lastName = "";
  String email = "";
  String course = "";
  String period = "";
  String contact = "";
  String skill = "";
  List? currentSkills = [];

  String firstNameErrorText = "Campo obrigatório!";
  bool firstNameError = false;

  String lastNameErrorText = "Campo obrigatório!";
  bool lastNameError = false;

  String emailErrorText = "Campo obrigatório!";
  bool emailError = false;

  String courseErrorText = "Campo obrigatório!";
  bool courseError = false;

  String periodErrorText = "Campo obrigatório!";
  bool periodError = false;

  String contactErrorText = "Campo obrigatório!";
  bool contactError = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [HelpTheme.helpDarkGrey, HelpTheme.helpButtonText])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const ReturnButton(),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Meu Perfil",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HelpTheme.helpWhiteIce,
                          fontSize: 40,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: HelpTheme.helpDarkGreyShadow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FutureBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                          future: fetchCurrentUserData(),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData && !snapshot.hasError) {
                              final user = snapshot.data;
                              firstName = snapshot.data!["name"];
                              lastName = snapshot.data!["lastname"];
                              email = snapshot.data!["email"];
                              course = snapshot.data!["curso"];
                              period = snapshot.data!["period"];
                              contact = snapshot.data!["contact"];
                              currentSkills = snapshot.data!["skills"];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (text) {
                                      firstName = text;
                                    },
                                    hint: "Primeiro Nome",
                                    action: () {},
                                    errorText: firstNameErrorText,
                                    showErrorText: firstNameError,
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user!["name"]),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  CustomTextField(
                                    keyboardType: TextInputType.name,
                                    onChanged: (text) {
                                      lastName = text;
                                    },
                                    hint: "Último Nome",
                                    action: () {},
                                    errorText: lastNameErrorText,
                                    showErrorText: lastNameError,
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user["lastname"]),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  CustomTextField(
                                    onChanged: (text) {
                                      course = text;
                                    },
                                    hint: "Curso",
                                    action: () {},
                                    errorText: courseErrorText,
                                    showErrorText: courseError,
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user["curso"]),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  CustomTextField(
                                    inputFormatters: [
                                      MaskedInputFormatter('#º')
                                    ],
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      period = text;
                                    },
                                    hint: "Periodo",
                                    action: () {},
                                    errorText: periodErrorText,
                                    showErrorText: periodError,
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user["period"]),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  CustomTextField(
                                    keyboardType: TextInputType.emailAddress,
                                    readOnly: true,
                                    onChanged: (text) {
                                      email = text;
                                    },
                                    hint: "Email",
                                    action: () {},
                                    errorText: emailErrorText,
                                    showErrorText: emailError,
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user["email"]),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  CustomTextField(
                                    inputFormatters: [
                                      MaskedInputFormatter('(##)#####-####')
                                    ],
                                    keyboardType: TextInputType.phone,
                                    onChanged: (text) {
                                      contact = text;
                                    },
                                    hint: "Numero do WhatsApp",
                                    action: () {},
                                    errorText: contactErrorText,
                                    showErrorText: contactError,
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user
                                                .data()
                                                .toString()
                                                .contains("contact")
                                            ? user["contact"]
                                            : ""),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const NewPasswordStl())),
                                    child: Text(
                                      "Alterar senha",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              decoration:
                                                  TextDecoration.underline),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: CustomTextField(
                                          onChanged: (text) {
                                            skill = text;
                                          },
                                          hint: "Habilidades",
                                          action: () {},
                                          errorText: "Campo Obrigatório!",
                                          obscure: false,
                                          showErrorText: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                      ),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: HelpTheme.helpYellow,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            width: 60,
                                            height: 60,
                                            child: IconButton(
                                                onPressed: () {
                                                  var collection =
                                                      FirebaseFirestore.instance
                                                          .collection("users");
                                                  collection
                                                      .doc(user["id"])
                                                      .update({
                                                    'skills':
                                                        FieldValue.arrayUnion(
                                                            [skill])
                                                  }).then(
                                                    (value) => setState(
                                                      () {},
                                                    ),
                                                  );
                                                },
                                                icon: const Icon(
                                                  Icons.add,
                                                  color:
                                                      HelpTheme.helpButtonText,
                                                  size: 32,
                                                )),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  ListView.builder(
                                      padding: const EdgeInsets.all(0),
                                      shrinkWrap: true,
                                      itemCount: currentSkills?.length,
                                      itemBuilder: ((context, index) {
                                        return Row(
                                          children: [
                                            SkillDot(
                                                skillName:
                                                    currentSkills?[index]),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var collection =
                                                    FirebaseFirestore.instance
                                                        .collection("users");
                                                collection
                                                    .doc(user["id"])
                                                    .update({
                                                  'skills':
                                                      FieldValue.arrayRemove([
                                                    currentSkills?[index]
                                                  ])
                                                }).then(
                                                  (value) => setState(
                                                    () {},
                                                  ),
                                                );
                                              },
                                              child: Icon(
                                                Icons.close_rounded,
                                                size: 20,
                                                color: Theme.of(context)
                                                    .errorColor,
                                              ),
                                            ),
                                          ],
                                        );
                                      })),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  YellowButtonLarge(
                                      title: "Atualizar",
                                      action: () {
                                        if (firstName == "" ||
                                            lastName == "" ||
                                            course == "" ||
                                            period == "" ||
                                            email == "" ||
                                            contact == "") {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return InformDialog(
                                                    dialogTitle:
                                                        "Preencha todos os campos",
                                                    buttonTitle: "Voltar",
                                                    buttonAction: () {
                                                      Navigator.pop(context);
                                                    });
                                              });
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return InformDialog(
                                                    dialogTitle:
                                                        "Dados atualizados com sucesso!",
                                                    buttonTitle: "Voltar",
                                                    buttonAction: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  const SubjectListPage()));
                                                    });
                                              });
                                          var collection = FirebaseFirestore
                                              .instance
                                              .collection("users");
                                          collection.doc(user["id"]).update(
                                            {
                                              "name": firstName,
                                              "lastname": lastName,
                                              "curso": course,
                                              "period": period,
                                              "email": email,
                                              "contact": contact
                                            },
                                          ).then((value) =>
                                              collection.doc(user["id"]).set({
                                                'skills': FieldValue.arrayUnion(
                                                    [currentSkills])
                                              }));
                                        }
                                      }),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: CircularProgressIndicator(
                                      color: Theme.of(context).primaryColor));
                            }
                            if (snapshot.hasError) {
                              return Container(
                                color: Colors.pink,
                                child: const Text("QUEBROUUUU"),
                              );
                            } else {
                              return Container();
                            }
                          }),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
