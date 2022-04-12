import 'package:flutter/material.dart';

class Card4 extends StatelessWidget {
  const Card4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/card4.png"), fit: BoxFit.fitWidth)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text("Vocês no comando!",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).canvasColor)),
          Text(
            
              "Toda a comunicação de quando,\n"
              "onde e como, é feita por vocês e\n"
              "via WhatsApp. Quer mais fácil\n"
              "que isso? Bora lá?!",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Theme.of(context).canvasColor),textAlign: TextAlign.right,),
                
        ],
      ),
    );
  }
}
