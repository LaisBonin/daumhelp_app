import 'package:daumhelp_app/widgets/button_large.dart';
import 'package:daumhelp_app/widgets/search_bar.dart';
import 'package:daumhelp_app/widgets/subject_listtile.dart';
import 'package:daumhelp_app/widgets/profile_card.dart';
import 'package:daumhelp_app/widgets/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: HelpTheme.theme,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            YellowButtonLarge(title: "Continuar", action: () {}),
            SubjectListTile(
              subjectName: 'Cálculo',
              subjectIcon: Icon(
                Icons.superscript,
                size: 40,
                color: Theme.of(context).primaryColor,
              ),
              subjectAction: () {},
            ),
            const SearchBar(),
            const ProfileCard(
              profileCourse: 'Engª Mecânica',
              profilePeriod: "7º Periodo",
              profileName: 'Eric',
            ),
          ],
        ),
      ),
    );
  }
}
