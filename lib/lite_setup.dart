import 'package:flutter/material.dart';
import 'package:hope_line/initial_screen.dart';
import 'dart:convert';
import 'dart:io';
// path provider
import 'package:path_provider/path_provider.dart';

class LiteSetup extends StatefulWidget {
  const LiteSetup({Key? key}) : super(key: key);

  @override
  _LiteSetupState createState() => _LiteSetupState();
}

class _LiteSetupState extends State<LiteSetup> {
  String phoneNumber = '';
  String emergencyContact1 = '';
  String emergencyContact2 = '';
  final GlobalKey<State> _dialogKey = GlobalKey<State>();

  void updatePhoneNumber(String newPhoneNumber) {
    setState(() {
      phoneNumber = newPhoneNumber;
    });
  }

  void updateEmergencyContact1(String newEmergencyContact1) {
    setState(() {
      emergencyContact1 = newEmergencyContact1;
    });
  }

  void updateEmergencyContact2(String newEmergencyContact2) {
    setState(() {
      emergencyContact2 = newEmergencyContact2;
    });
  }

  void saveDataToJson(BuildContext context) async {
    Map<String, dynamic> data = {
      'phoneNumber': phoneNumber,
      'emergencyContact1': emergencyContact1,
      'emergencyContact2': emergencyContact2,
    };

    try {
      Directory appDocumentsDirectory =
          await getApplicationDocumentsDirectory();
      String filePath = '${appDocumentsDirectory.path}/user_data.json';
      File file = File(filePath);

      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }

      file.writeAsStringSync(jsonEncode(data));
      showDialog(
        context: _dialogKey.currentContext!,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Text('Data Saved'),
            content: Text('User data has been saved to user_data.json'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                },
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to save user data. Error: $e'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void navigateToInitialScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InitialScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the top of the screen
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40), // Increased space from the top
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
              child: Builder(
                builder: (BuildContext buttonContext) {
                  return ElevatedButton(
                    onPressed: () {
                      saveDataToJson(buttonContext);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
