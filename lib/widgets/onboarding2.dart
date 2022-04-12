import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Row(
            children: [
              Text("O poder do\n" "benefício mútuo!",
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
          flex: 0,
          child: Row(
            children: [
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
        ),
      ],
    );
  }
}
