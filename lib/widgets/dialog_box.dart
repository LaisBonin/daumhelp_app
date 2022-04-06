import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class DialogBox extends StatefulWidget {
  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: const Text('Exibir Alerta'),
            onPressed: () {
              showAlertDialog2(context);
            },
          ),
        ),
      ],
    );
  }
}
showAlertDialog2(BuildContext context) {
  Widget cancelaButton = FloatingActionButton(
    child: const Text("Sair"),
    onPressed: () {},
  );
  Widget continuaButton = FloatingActionButton(
    child: const Text("Voltar"),
    onPressed: () {},
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    content: const Text("Voce realmente deseja sair?"),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
