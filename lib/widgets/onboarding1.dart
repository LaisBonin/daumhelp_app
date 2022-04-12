import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Row(
            children: [
              Text("Por que ajudar \n""um colega?",
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
            children: [
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
        ),
      ],
    );
  }
}
