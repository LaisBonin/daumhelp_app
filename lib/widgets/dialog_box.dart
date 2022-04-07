import 'package:flutter/material.dart';

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
  // exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
