// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
            "Settings",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
          ),
        ]),
        SizedBox(height: 40),
        Expanded(child: Container())
      ],
    ));
  }
}
