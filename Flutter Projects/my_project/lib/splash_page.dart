/* Authored by: Ela Mariz Rivera
Company: Nextpire
Project: Advote
Feature: [ADV-001] Splash Screen
Description: A page where users can choose whether to sign up or login.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 500,
              left: -200,
              right: -200,
              child: Container(
                width: 863,
                height: 808,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    center: Alignment.bottomCenter,
                    radius: 2.0,
                    colors: [
                      Color.fromARGB(255, 4, 94, 173),
                      Color.fromARGB(255, 0, 57, 107),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 180,
              left: 20,
              right: 20,
              child: Image.asset(
                'assets/logo2.png', // Path to your image asset
                width: 220, // Adjust width as needed
                height: 220, // Adjust height as needed
              ),
            ),
            // Buttons
            Positioned(
              bottom: 100,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  SizedBox(
                    width: 280, // Adjust the width of the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle login button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 6, 112, 203),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 14), // Adjust button height
                        child: Text('Login',
                            style: TextStyle(
                                fontSize: 16,
                                color: const Color.fromARGB(
                                    255, 255, 255, 255))), // Adjust text size
                      ),
                    ),
                  ),
                  SizedBox(height: 15), // Add spacing between buttons
                  SizedBox(
                    width: 280, // Adjust the width of the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle sign-up button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side:
                              BorderSide(color: Colors.lightBlue), // Add border
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 14), // Adjust button height
                        child: Text('Sign Up with ADNU GBOX',
                            style: TextStyle(
                                fontSize: 16,
                                color: const Color.fromARGB(
                                    255, 255, 255, 255))), // Adjust text size
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
