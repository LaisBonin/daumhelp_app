import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daumhelp_app/pages/newpass_page_stl.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/return_button.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:daumhelp_app/widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullRegistrationPageStl extends StatefulWidget {
  FullRegistrationPageStl({Key? key}) : super(key: key);

  @override
  State<FullRegistrationPageStl> createState() =>
      _FullRegistrationPageStlState();
}

class _FullRegistrationPageStlState extends State<FullRegistrationPageStl> {
  Future<void> fetchCurrentUserData() async {
    final collection = FirebaseFirestore.instance.collection("users");
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      currentUserInfo = <String>[] as DocumentSnapshot<Map<String, dynamic>>;
    }
    final currentUserData = await collection.doc(currentUser?.uid).get();
    currentUserInfo = currentUserData;
  }

  DocumentSnapshot<Map<String, dynamic>>? currentUserInfo;
  String? firstName;
  String? lastName;
  String? email;
  String? course;
  String? period;
  String? contact;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _periodController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchCurrentUserData();
  }

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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            onChanged: (text) {
                              firstName = text;
                            },
                            hint: "Primeiro Nome",
                            action: () {},
                            errorText: "Campo Obrigatório!",
                            obscure: false,
                            controller: _firstNameController,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                            onChanged: (text) {
                              lastName = text;
                            },
                            hint: "Último Nome",
                            action: () {},
                            errorText: "Campo Obrigatório!",
                            obscure: false,
                            controller: _lastNameController,
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
                            controller: _courseController,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                            onChanged: (text) {
                              period = text;
                            },
                            hint: "Periodo",
                            action: () {},
                            errorText: "Campo Obrigatório!",
                            obscure: false,
                            controller: _periodController,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                            onChanged: (text) {
                              email = text;
                            },
                            hint: "Email",
                            action: () {},
                            errorText: "Campo Obrigatório!",
                            obscure: false,
                            controller: _emailController,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                            onChanged: (text) {
                              contact = text;
                            },
                            hint: "Numero do WhatsApp",
                            action: () {},
                            errorText: "Campo Obrigatório!",
                            obscure: false,
                            controller: _contactController,
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
                                      color: Theme.of(context).canvasColor,
                                      decoration: TextDecoration.underline),
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
                                    obscure: false),
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
                                          color: HelpTheme.helpButtonText,
                                          size: 32,
                                        )),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          YellowButtonLarge(title: "Atualizar", action: () {}),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ),
        // ),
      ),
    );
  }
}
