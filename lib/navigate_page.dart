// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class NavigationePage extends StatefulWidget {
  @override
  _NavigationePageState createState() => _NavigationePageState();
}

class _NavigationePageState extends State<NavigationePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Text(
            'Selected Tab: $_selectedIndex',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        bottomNavigationBar: MoltenBottomNavigationBar(
          selectedIndex: _selectedIndex,
          domeHeight: 25,
          onTabChange: (clickedIndex) {
            setState(() {
              _selectedIndex = clickedIndex;
            });
          },
          tabs: [
            MoltenTab(
              icon: const Icon(Icons.search),
            ),
            MoltenTab(
              icon: const Icon(Icons.home),
              title: const Text('home'),
            ),
            MoltenTab(
              icon: const Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
