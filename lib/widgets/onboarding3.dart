import 'package:flutter/material.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/card3.png"), fit: BoxFit.none)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("E aí? Bora socializar?",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).canvasColor)),
          Text(
              "Vai perder a chance de fazer\n"
                  "uma nova amizade? O Dá um\n"
                  "Help! é mais uma forma de\n"
                  "contato entre estudantes",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Theme.of(context).canvasColor)),
        ],
      ),
    );
  }
}
