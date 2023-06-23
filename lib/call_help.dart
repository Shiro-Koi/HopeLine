//basic call help screen

import 'package:flutter/material.dart';

class CallHelp extends StatelessWidget {
  const CallHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Call for Help')),
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