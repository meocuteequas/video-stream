import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String url;

  const DetailsPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
            child: Column(children: <Widget>[
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("http://10.0.2.2:8000/$url"),
                    fit: BoxFit.cover)),
          ))
        ])),
        Positioned(
            top: 60.0,
            left: 20.0,
            child: Material(
              color: Colors.transparent,
              child: Ink(
                decoration: const ShapeDecoration(
                    shape: CircleBorder(), color: Colors.white),
                child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    // color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            )),
      ],
    ));
  }
}
