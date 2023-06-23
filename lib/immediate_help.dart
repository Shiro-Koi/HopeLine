// basic immediate help screen

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hope_line/applicationConstants.dart';

class ImmediateHelp extends StatelessWidget {
  ImmediateHelp({Key? key}) : super(key: key) {
    var firebase = applicationConstants.getFirebaseInstance();
    var dataRef = firebase.ref("data");

    var newRef = dataRef.push();
    newRef.set({
      "longitude": 0,
      "latitude": 0,
      "date_sent": DateTime.now().millisecondsSinceEpoch
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Immediate Help')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // button to call the first emergency contact
            ElevatedButton(
              onPressed: () => {},
              child: const Text('Call Emergency Contact 1'),
            ),
            // button to call the second emergency contact
            ElevatedButton(
              onPressed: () => {},
              child: const Text('Call Emergency Contact 2'),
            ),
          ],
        ),
      ),
    );
  }
}
