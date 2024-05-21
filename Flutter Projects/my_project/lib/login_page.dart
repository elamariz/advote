/* Authored by: Ela Mariz Rivera
Company: Nextpire
Project: Advote
Feature: [ADV-002] Login
Description: A login page for users to fully access the platforms
 */

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Add image behind circles and logo
            Positioned(
              top: -50, // Adjust the top position
              left: 0, // Adjust the left position
              child: Image.asset(
                'assets/background.png', // Path to your background image asset
              ),
            ),
            Positioned(
              top: 90,
              left: 20,
              right: 20,
              child: Image.asset(
                'assets/logo1.png', // Path to your logo image asset
                width: 120, // Adjust width as needed
                height: 120, // Adjust height as needed
              ),
            ),
            Positioned(
              left: -200,
              top: 230,
              child: Container(
                child: Center(
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
              ),
            ),
            Positioned(
              top: -120,
              left: -150,
              child: Container(
                width: 350,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 0, 111, 208),
                      Color.fromARGB(255, 0, 57, 107),
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 150, 0, 0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            const MyStatefulWidget(),
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 210, 10, 20),
      child: Stack(
        children: [
          ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: const Text(
                  'Sign in to continue.',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
                child: SizedBox(
                  width: 100,
                  height: 70,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(150, 236, 236, 236),
                      labelText: 'User Name',
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SizedBox(
                  width: 100,
                  height: 70,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(150, 236, 236, 236),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 6, 112, 203)),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width / 2 - 120,
            child: Row(
              children: <Widget>[
                const Text('Don\'t have an account?',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {},
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
