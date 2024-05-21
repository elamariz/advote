/* Authored by: Ela Mariz Rivera
Company: Nextpire
Project: Advote
Feature: [ADV-000] Loading Screen
Description: A page that displays upon starting the application.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.bottomCenter,
              radius: 2.0,
              colors: [
                Color.fromARGB(255, 4, 94, 173),
                Color.fromARGB(255, 0, 57, 107),
              ],
            ),
          ),
          child: Center(
            child: Image.asset(
              'assets/logo3.png', // Path to your image asset
              width: 300, // Adjust width as needed
              height: 300, // Adjust height as needed
            ),
          ),
        ),
      ),
    );
  }
}
