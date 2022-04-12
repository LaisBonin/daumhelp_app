import 'package:daumhelp_app/pages/my_applications_page.dart';
import 'package:daumhelp_app/pages/subject_list_page.dart';
import 'package:daumhelp_app/widgets/button_large.dart';
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
      home: const MyApplicationsPage(),
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
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  colors: [HelpTheme.helpDarkGrey, HelpTheme.helpButtonText])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              YellowButtonLarge(
                  title: "Continuar",
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SubjectListPage(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
