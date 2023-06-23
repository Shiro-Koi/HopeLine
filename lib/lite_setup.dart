// lite setup screen, only asks for phone number and two emergency contacts
// lite setup screen implementation here

import 'package:flutter/material.dart';
import 'package:hope_line/initial_screen.dart';

// setting up the lite setup screen with a stateful widget
// this is so that we can store the phone number and emergency contacts

class LiteSetup extends StatefulWidget {
  const LiteSetup({Key? key}) : super(key: key);

  @override
  _LiteSetupState createState() => _LiteSetupState();
}

class _LiteSetupState extends State<LiteSetup> {
  // variables to store the phone number and emergency contacts
  String phoneNumber = '';
  String emergencyContact1 = '';
  String emergencyContact2 = '';

  // function to update the phone number
  void updatePhoneNumber(String newPhoneNumber) {
    setState(() {
      phoneNumber = newPhoneNumber;
    });
  }

  // function to update the first emergency contact
  void updateEmergencyContact1(String newEmergencyContact1) {
    setState(() {
      emergencyContact1 = newEmergencyContact1;
    });
  }

  // function to update the second emergency contact
  void updateEmergencyContact2(String newEmergencyContact2) {
    setState(() {
      emergencyContact2 = newEmergencyContact2;
    });
  }

  // function to navigate to the initial screen
  void navigateToInitialScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InitialScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lite Setup')),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // text field to enter the phone number
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                  onChanged: (text) {
                    updatePhoneNumber(text);
                  },
                ),
              ),
              SizedBox(height: 20),
              // text field to enter the first emergency contact
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Emergency Contact 1',
                  ),
                  onChanged: (text) {
                    updateEmergencyContact1(text);
                  },
                ),
              ),
              SizedBox(height: 20),
              // text field to enter the second emergency contact
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Emergency Contact 2',
                  ),
                  onChanged: (text) {
                    updateEmergencyContact2(text);
                  },
                ),
              ),
              SizedBox(height: 20),
              // button to navigate to the initial screen
              SizedBox(
                height: 60,
                width: 200,
                child: ElevatedButton(
                  onPressed: navigateToInitialScreen,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}