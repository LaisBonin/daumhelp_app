import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/card1.png"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Por que ajudar um colega?",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).canvasColor)),
          Text(
              "Quem nunca \n"
              "passou perrengue \n"
              "em alguma matéria e \n"
              "precisava de monitor para \n"
              "um empurrãozinho? Nem \n"
              "sempre é fácil de achar né?",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Theme.of(context).canvasColor)),
        ],
      ),
    );
  }
}
