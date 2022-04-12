import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/card2.png"), fit: BoxFit.none)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("O poder do benefício mútuo!",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).canvasColor)),
          Text(
              "Toda vez que você ensina outra\n"
              "pessoa, seu conhecimento é\n"
              "reforçado. Quem ensina\n"
              "aprende mais!",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Theme.of(context).canvasColor)),
        ],
      ),
    );
  }
}
