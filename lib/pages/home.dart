// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../components/image_placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

Future<List<dynamic>> fetchImages() async {
  final response =
      await http.get(Uri.parse('https://localhost:7227/media/images'));

  if ((response.statusCode == 200)) return jsonDecode(response.body);

  throw Exception('Failed to load album');
}

class HomeState extends State<Home> {
  late Future<List<dynamic>> _futureImages;


  @override
  void initState() {
    super.initState();

    _futureImages = fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _futureImages,
        builder: (context, snapshot) => snapshot.hasData
            ? Expanded(
              child: MasonryGridView.builder(
                  itemCount: snapshot.data?.length,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                  itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(4),
                      child: Image.network("https://localhost:7227/" + snapshot.data?[index]["source"])),
                ),
            )
            : Expanded(child: ImagePlaceholder()));
  }
}
