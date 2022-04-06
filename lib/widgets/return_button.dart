// import 'dart:async';

// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   State<StatefulWidget> createState() => _HomePageState();
// }

// class _HomePageState extends StatefulBuilder<HomePage> {
//   future<bool> () async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: const Text('Are you sure?'),
//             content: const Text('Do you want to exit an App'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child: const Text('No'),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(true),
//                 child: const Text('Yes'),
//               ),
//             ],
//           ),
//         )) ??
//         false;
//   }
// }
