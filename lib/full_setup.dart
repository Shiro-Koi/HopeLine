// full setup screen, asks for name, email, phone number, and two emergency contacts

import 'package:flutter/material.dart';
import 'package:hope_line/initial_screen.dart';

// setting up the full setup screen with a stateful widget
// this is so that we can store the name, email, phone number, and emergency contacts

class FullSetup extends StatefulWidget {
  const FullSetup({Key? key}) : super(key: key);

  @override
  _FullSetupState createState() => _FullSetupState();
}

class _FullSetupState extends State<FullSetup> {
  // variables to store the name, email, phone number, and emergency contacts
  String name = '';
  String email = '';
  String phoneNumber = '';
  String emergencyContact1 = '';
  String emergencyContact2 = '';

  // function to update the name
  void updateName(String newName) {
    setState(() {
      name = newName;
    });
  }

  // function to update the email
  void updateEmail(String newEmail) {
    setState(() {
      email = newEmail;
    });
  }

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

  // make the full setup screen widget using the variables and functions above
  // this is the widget that will be displayed on the screen
  // it is a column with five text fields and a button
  // the text fields are for the name, email, phone number, and two emergency contacts
  // the button is to navigate to the initial screen
  // the text fields are stateful widgets so that we can store the values
  // the button is a stateless widget because it does not need to store any values
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Full Setup',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'images/full_setup_icon.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                onChanged: (text) {
                  updateName(text);
                },
              ),
              ),
              const SizedBox(height: 20),
              
              SizedBox(
                width: 300,
                child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                onChanged: (text) {
                  updateEmail(text);
                },
              ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
                onChanged: (text) {
                  updatePhoneNumber(text);
                },
              ),
              ),
              const SizedBox(height: 20),
              // text field to enter the first emergency contact
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Emergency Contact 1',
                  ),
                  onChanged: (text) {
                    updateEmergencyContact1(text);
                  },
                ),
              ),
              const SizedBox(height: 20),
              // text field to enter the second emergency contact
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Emergency Contact 2',
                  ),
                  onChanged: (text) {
                    updateEmergencyContact2(text);
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: navigateToInitialScreen,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}