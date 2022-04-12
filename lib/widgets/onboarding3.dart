import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Row(
            children: [
              Text("E aí? Bora\n" "socializar?",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Theme.of(context).canvasColor)),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  "Vai perder a chance de fazer\n"
                  "uma nova amizade? O Dá um\n"
                  "Help! é mais uma forma de\n"
                  "contato entre estudantes",
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Theme.of(context).canvasColor)),
            ],
          ),
        ),
      ],
    );
  }
}
