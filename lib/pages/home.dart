// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

Future<List<String>> loadImages() async {
  Response response = await get(Uri.parse('http://10.0.2.2:8000/images'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw "Unable to retrieve posts.";
  }
}

class HomeState extends State<Home> {
  List<String> _images = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadImages(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Home",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
              ),
            ]),
            SizedBox(height: 40),
            Expanded(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 9 / 16,
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return RawMaterialButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             DetailsPage(url: _images[index])));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'http://10.0.2.2:8000/${_images[index]}'),
                                      fit: BoxFit.cover)),
                            ));
                      },
                      itemCount: 6,
                    )))
          ],
        ));
      },
    );
  }
}
