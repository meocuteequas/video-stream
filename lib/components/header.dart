// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(
        //   String.fromCharCode(Icons.arrow_back_ios_new.codePoint),
        //   style: TextStyle(
        //     color: Colors.black,
        //     inherit: false,
        //     fontSize: 32,
        //     fontWeight: FontWeight.w700,
        //     fontFamily: Icons.arrow_back_ios_new.fontFamily,
        //   ),
        // ),
        // SizedBox(
        //   width: 16,
        // ),
        Text("Explore",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
      ],
    );
  }
}
