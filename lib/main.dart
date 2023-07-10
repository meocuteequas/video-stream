// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures

import 'package:client/components/header.dart';
import 'package:client/pages/explore.dart';
import 'package:client/pages/home.dart';
import 'package:client/pages/search.dart';
import 'package:client/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const Layout(),
    );
  }
}

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => LayoutState();
}

class LayoutState extends State<Layout> {
  int selectedIndex = 0;
  List pages = [Home(), Explore(), Search(), Settings()];

  void tabChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 56, left: 8, right: 8),
        child: Column(children: [
          Header(),
          SizedBox(
            height: 24,
          ),
          pages[selectedIndex]
        ]),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: GNav(
              gap: 8,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.all(16),
              onTabChange: tabChanged,
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.explore, text: 'Explore'),
                GButton(icon: Icons.search, text: 'Search'),
                GButton(icon: Icons.settings, text: 'Settings'),
              ]),
        ),
      ),
    );
  }
}
