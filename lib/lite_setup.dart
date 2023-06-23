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

  // make the full setup screen widget using the variables and functions above
  // this is the widget that will be displayed on the screen
  // it is a column with five text fields and a button
  // the text fields are for the phone number and two emergency contacts
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
              Text(
                'Lite Setup',
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'images/lite_setup_icon.png',
                height: 150,
                width: 150,
              ),
              SizedBox(height: 20),
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
              Container(
                width: 200,
                height: 60,
                child: ElevatedButton(
                  onPressed: navigateToInitialScreen,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
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
