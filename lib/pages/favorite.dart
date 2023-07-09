// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 80,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Favorite",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
          ),
        ]),
        SizedBox(height: 40),
        Expanded(child: Container())
      ],
    ));
  }
}
