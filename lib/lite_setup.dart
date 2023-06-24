import 'package:flutter/material.dart';
import 'package:hope_line/home_screen.dart';
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
  String noteToEmergencyContacts = '';
  final GlobalKey<State> _dialogKey = GlobalKey<State>();
  bool isLoading = false;

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

  // function to update the note to be sent to the emergency contacts
  void updateNoteToEmergencyContacts(String newNoteToEmergencyContacts) {
    setState(() {
      noteToEmergencyContacts = newNoteToEmergencyContacts;
    });
  }

  void saveDataToJson(BuildContext context) async {
    setState(() {
      isLoading = true;
    });

    Map<String, dynamic> data = {
      'phoneNumber': phoneNumber,
      'emergencyContact1': emergencyContact1,
      'emergencyContact2': emergencyContact2,
      'noteToEmergencyContacts': noteToEmergencyContacts,
    };

    try {
      Directory appDocumentsDirectory =
          await getApplicationDocumentsDirectory();
      String filePath = '${appDocumentsDirectory.path}/lite_data.json';
      File file = File(filePath);

      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }

      file.writeAsStringSync(jsonEncode(data));

      // Show loading screen for 5 seconds
      await Future.delayed(const Duration(seconds: 5));

      showDialog(
        context: _dialogKey.currentContext ?? context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Data Saved'),
            content: const Text('User data has been saved to lite_data.json'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  navigateToHomeScreen();
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
            title: const Text('Error'),
            content: Text('Failed to save user data. Error: $e'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  // function to navigate to the home screen
  void navigateToHomeScreen() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the top of the screen
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40), // Increased space from the top
              const Text(
                'Anonymous Sign Up',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'images/lite_setup_icon.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  //only accept numbers
                  keyboardType: TextInputType.number,
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
              SizedBox(
                width: 300,
                child: TextField(
                  //only accept numbers
                  keyboardType: TextInputType.number,
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
              SizedBox(
                width: 300,
                child: TextField(
                  //only accept numbers
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Emergency Contact 2',
                  ),
                  onChanged: (text) {
                    updateEmergencyContact2(text);
                  },
                ),
              ),
              // text field to enter the note to be sent to the emergency contacts
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Note to Emergency Contacts',
                  ),
                  onChanged: (text) {
                    updateNoteToEmergencyContacts(text);
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                height: 60,
                child: Builder(
                  builder: (BuildContext buttonContext) {
                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              saveDataToJson(buttonContext);
                            },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Submit',
                              style: TextStyle(fontSize: 20),
                            ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
