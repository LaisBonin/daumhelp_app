import 'package:flutter/material.dart';

class Card4 extends StatelessWidget {
  const Card4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 0,
          child: Row(
            children: [
              Text("Vocês no\n" "comando!",
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
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                  "Toda a comunicação de quando,\n"
                  "onde e como, é feita por vocês e\n"
                  "via WhatsApp. Quer mais fácil\n"
                  "que isso? Bora lá?!",
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
