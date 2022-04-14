import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daumhelp_app/pages/newpass_page_stl.dart';
import 'package:daumhelp_app/pages/subject_list_page.dart';
import 'package:daumhelp_app/pages/subject_page.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:google_fonts/google_fonts.dart';

class FullRegistrationPageStl extends StatelessWidget {
  FullRegistrationPageStl({Key? key}) : super(key: key);

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
  String? firstName = "";
  String? lastName = "";
  String? email = "";
  String? course = "";
  String? period = "";
  String? contact = "";
  List? currentSkills;

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
                                    errorText: "Campo Obrigatório!",
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user!
                                                .data()
                                                .toString()
                                                .contains("name")
                                            ? user["name"]
                                            : ""),
                                    showErrorText: false,
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
                                    errorText: "Campo Obrigatório!",
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user
                                                .data()
                                                .toString()
                                                .contains("lastname")
                                            ? user["lastname"]
                                            : ""),
                                    showErrorText: false,
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
                                    errorText: "Campo Obrigatório!",
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user
                                                .data()
                                                .toString()
                                                .contains("curso")
                                            ? user["curso"]
                                            : ""),
                                    showErrorText: false,
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
                                    errorText: "Campo Obrigatório!",
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user
                                                .data()
                                                .toString()
                                                .contains("period")
                                            ? user["period"]
                                            : ""),
                                    showErrorText: false,
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
                                    errorText: "Campo Obrigatório!",
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user
                                                .data()
                                                .toString()
                                                .contains("email")
                                            ? user["email"]
                                            : ""),
                                    showErrorText: false,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  CustomTextField(
                                    inputFormatters: [
                                      MaskedInputFormatter('(##)#########')
                                    ],
                                    keyboardType: TextInputType.phone,
                                    onChanged: (text) {
                                      contact = text;
                                    },
                                    hint: "Numero do WhatsApp",
                                    action: () {},
                                    errorText: "Campo Obrigatório!",
                                    obscure: false,
                                    controller: TextEditingController(
                                        text: user
                                                .data()
                                                .toString()
                                                .contains("contact")
                                            ? user["contact"]
                                            : ""),
                                    showErrorText: false,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  InkWell(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NewPasswordStl())),
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
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.add,
                                                  color:
                                                      HelpTheme.helpButtonText,
                                                  size: 32,
                                                )),
                                          ))
                                    ],
                                  ),
                                  // const SizedBox(
                                  //   height: 16,
                                  // ),
                                  // ListView.builder(
                                  //     padding: const EdgeInsets.all(0),
                                  //     shrinkWrap: true,
                                  //     itemCount: currentSkills!.length,
                                  //     itemBuilder: ((context, index) {
                                  //       return SkillDot(
                                  //           skillName: currentSkills![index]);
                                  //     })),
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
                                          return showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      "PREENCHA TODOS OS CAMPOS"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, "OK"),
                                                      child: const Text("OK"),
                                                    )
                                                  ],
                                                );
                                              });
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      "DADOS ATUALIZADOS COM SUCESSO"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const SubjectListPage(),
                                                        ),
                                                      ),
                                                      child: const Text("OK"),
                                                    )
                                                  ],
                                                );
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
                                          );
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
                                color: Colors.white,
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
