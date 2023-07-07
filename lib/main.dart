// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'details.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

Future<List<String>> loadImages() async {
  final response = await http.get(Uri.parse('http://10.0.2.2:8000/images'));

  return (jsonDecode(response.body) as List).map((e) => e.toString()).toList();
}

class HomeState extends State<Home> {
  List<String> _images = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadImages(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else {
          _images = snapshot.data;

          return Scaffold(
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Image(image: AssetImage('assets/logo.png')),
                SizedBox(height: 40),
                Expanded(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 9 / 16,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8.0,
                                  mainAxisSpacing: 8),
                          itemBuilder: (context, index) {
                            return RawMaterialButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      image: DecorationImage(
                                          image: NetworkImage('http://10.0.2.2:8000/${_images[index]}'),
                                          fit: BoxFit.cover)),
                                ));
                          },
                          itemCount: 6,
                        )))
              ],
            )),
          );
        }
      },
    );
  }
}
