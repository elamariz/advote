/* Authored by: Angelea Dela Torre
Company: Nextpire
Project: Advote
Feature: [ADV-002] Sign Up
Description: A sign up page where users create an AdVOTE account to fully access the platform
 */

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MyStatefulWidget(),
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
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController idNoController = TextEditingController();
  TextEditingController colDeptController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isChecked = false;
  bool _isAllFieldsFilled = false;

  @override
  Widget build(BuildContext context) {
    // Main widget tree containing the form elements
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          // Add a blue back button on the top left
          Positioned(
            top: 50,
            left: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Color.fromARGB(255, 0, 57, 107)),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate to the previous page
              },
            ),
          ),
          ListView(
            children: <Widget>[
              // Container for the "Create Account" text
              Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Create Account',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 57, 107),
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
              // Text field for the email input
              buildTextField(emailController, 'ADNU GBOX Account'),
              // Text field for the name input
              buildTextField(
                  nameController, 'Full Name (First Name, Last Name)'),
              // Text field for the ID number input
              buildTextField(idNoController, 'ID Number'),
              // Text field for the college department input
              buildTextField(colDeptController, 'College Department'),
              // Text field for the password input
              buildTextField(passwordController, 'Password', obscureText: true),
              // Text field for confirming the password input
              buildTextField(confirmPasswordController, 'Confirm Password',
                  obscureText: true),
              // Row containing a checkbox and text for terms and conditions
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked = value ?? false;
                        _updateSignUpButtonState();
                      });
                    },
                    activeColor: Color.fromARGB(255, 17, 101, 174),
                  ),
                  Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              // Container for the "Sign Up" button
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      _isAllFieldsFilled
                          ? Color.fromARGB(255, 17, 101, 174)
                          : Colors
                              .grey, // Change button color based on fields validation
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  onPressed: _isAllFieldsFilled
                      ? _onSignUpPressed
                      : null, // Disable button if not all fields are filled
                ),
              ),
              // Row containing text and button for logging in
              Row(
                children: <Widget>[
                  const Text('Already have an account?'),
                  TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 0, 57, 107)),
                    ),
                    onPressed: () {
                      // Navigates to the login screen
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper function to build text input fields
  Widget buildTextField(TextEditingController controller, String labelText,
      {bool obscureText = false}) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        onChanged: (_) =>
            _updateSignUpButtonState(), // Update button state when text changes
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
    );
  }

  // Function to update the state of the "Sign Up" button based on form inputs
  void _updateSignUpButtonState() {
    setState(() {
      _isAllFieldsFilled = emailController.text.isNotEmpty &&
          nameController.text.isNotEmpty &&
          idNoController.text.isNotEmpty &&
          colDeptController.text.isNotEmpty &&
          passwordController.text.isNotEmpty &&
          confirmPasswordController.text.isNotEmpty &&
          _isChecked;
    });
  }

  // Function to handle the "Sign Up" button press
  void _onSignUpPressed() {
    print(emailController.text);
    print(nameController.text);
    print(idNoController.text);
    print(colDeptController.text);
    print(passwordController.text);
  }
}
